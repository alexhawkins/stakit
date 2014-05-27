class Question < ActiveRecord::Base
  has_many :question_topics, dependent: :destroy
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics
  attr_reader :topic_tokens

  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end
end
