class AnswerVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
  # after_save :update_answer

  private

  def update_answer
   # self.answer.update_rank
  end
end
