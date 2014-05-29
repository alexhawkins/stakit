class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_topics, dependent: :destroy
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics
  has_many :answers, dependent: :destroy
  attr_reader :topic_tokens

   default_scope { order('created_at DESC') }
   
  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end
end
