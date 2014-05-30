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
  
  accepts_nested_attributes_for :user_attachments
  mount_uploader :avatar, AvatarUploader

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
  
end
