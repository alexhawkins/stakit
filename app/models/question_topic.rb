class QuestionTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :question
  validates :topic, presence: true
  validates :question, presence: true
end
