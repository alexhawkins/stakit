class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  after_create :create_vote
  after_create :send_following_emails

  default_scope { order('rank DESC') }

  def points
    self.answer_votes.sum(:value).to_i
  end

  def update_rank
    age = (self.created_at - Time.new(1970,1,1)) / 86400
    new_rank = age + points

    self.update_attribute(:rank, new_rank)
  end

  private

# automatically be set to up vote an Answer after creation
  def create_vote
   user.answer_votes.create(value: 1, answer: self)
  end

  def send_following_emails
    self.question.follow_questions.each do | follow |
      FollowQuestionMailer.new_answer(follow.user, self.question, self).deliver
    end
  end

end
