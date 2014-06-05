class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_topics, dependent: :destroy
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics
  has_many :answers, dependent: :destroy
  has_many :follow_questions, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy
  after_create :create_follow

  validates :user, presence: true
  validates :name, length: {
    minimum: 10,
    maximum: 300,
    too_short: "must have at least 10 characters",
    too_long: "must have less than 300 characters",
    presence: true 
  }

  attr_reader :topic_tokens

  default_scope { order('created_at DESC') }
   
  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end
  #automatically follow your own Questions
  def create_follow
    user.follow_questions.create(question: self)
  end
end
