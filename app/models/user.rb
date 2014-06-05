class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :stacks, dependent: :destroy
  has_many :favorite_stacks, dependent: :destroy
  has_many :user_attachments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_votes, dependent: :destroy
  has_many :follow_questions, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :activities, dependent: :destroy
  has_many :videos, dependent: :destroy

  accepts_nested_attributes_for :user_attachments
  mount_uploader :avatar, AvatarUploader
  scope :alphabetically, -> { order('name ASC') }

  def role?(base_role)
    role == base_role.to_s
  end

  # The favorited_stack method takes a Stack object and returns a 
  # Favorite_Stack object if the stack argument has an associated 
  # record in the favorites table. If there is no favorite for the
  # given stack and user, the method will return nil. This method 
  # will allow us to toggle favorite / unfavorite links.
  def favorited_stack(stack)
    self.favorite_stacks.where(stack_id: stack.id).first
  end

  # toggle between followed and unfollowed states
  # Method returns true if question is already being followed
  # and will show 'unfollow' in the UI
  def followed_question(question)
    self.follow_questions.where(question_id: question.id).first
  end

  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy
  end
  
end
