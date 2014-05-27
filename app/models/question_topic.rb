class QuestionTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :question
end
