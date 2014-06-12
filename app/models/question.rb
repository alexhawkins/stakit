class Question < ActiveRecord::Base

  belongs_to :user
  has_many :question_topics, dependent: :destroy
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics
  has_many :answers, dependent: :destroy
  has_many :follow_questions, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy
  after_create :create_follow
  after_create :strip_it
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

  include PgSearch
   pg_search_scope :search, against: { name: 'A', description: 'B' },
     using: {
        trigram: { threshold: 0.5},
        tsearch: {
           prefix: true,
           dictionary: "english"
         }
      },
     associated_against: {
      topics: { name: 'C' },
      answers: { body: 'D' }
     },
     ignoring: :accents,
     ranked_by: ":tsearch + (0.25 * :trigram)",
     order_within_rank: "questions.updated_at DESC"
   
  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end
  #automatically follow your own Questions
  def create_follow
    user.follow_questions.create(question: self)
  end

  #strip any trailing punctuation
  def strip_it
    new_name = self.name.gsub(/^[^a-zA-Z]+/, '').gsub(/[^a-zA-Z]+$/, '') + "?"
    self.update_attribute(:name, new_name)
  end

  def self.text_search(query)
    if query.present?
     #query = query.split(" ").join(" & ") 
     search(query)
    else
     order('created_at desc')
    end
  end
end
