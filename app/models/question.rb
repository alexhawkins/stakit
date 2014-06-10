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
  validates :name, 
    presence: true,
    uniqueness: { scope: :user_id, case_sensitive: false },
    length: {
      minimum: 10,
      maximum: 300,
      too_short: "must have at least 10 characters",
      too_long: "must have less than 300 characters",
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

  def self.search(search)
    if search.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(search)})) +
        ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(search)}))
      RANK
      where("name @@ :s or description @@ :s", s: search).order("#{rank} desc")
    else
     order('created_at desc')
    end
  end
end
