class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  after_create :create_vote

  default_scope { order('rank DESC') }

  def points
    self.answer_votes.sum(:value).to_i
  end

  private

# automatically be set to up vote an Answer after creation
  def create_vote
   user.answer_votes.create(value: 1, answer: self)
  end

end
