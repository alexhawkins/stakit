class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  after_create :create_vote
  after_create :create_follow
  after_create :send_following_emails
  has_many :activities, as: :trackable, dependent: :destroy

  #VALIDATIONS
  validates :question, presence: true
  validates :user, presence: true
  #make sure that each user can only answer a question once
 # validates :user_id, uniqueness: { scope: :question_id }
  validates :body,
    presence: true,
    length: {
    minimum: 10,
    maximum: 5000,
    too_short: "must have at least 10 characters",
    too_long: "must have less than 2000 characters",
  }

  default_scope { order('rank DESC') }

  def points
    self.answer_votes.sum(:value).to_i
  end

  def update_rank
    age = (self.created_at - Time.new(1970,1,1)) / 86400
    new_rank = age + points

    self.update_attribute(:rank, new_rank)
  end

  def markdown
    renderer = Redcarpet::Render::HTML.new(safe_links_only: true, hard_wrap: true, filter_html: true, prettify: true)
    extensions = {fenced_code_blocks: true, autolink: true, highlight: true, strikethrough: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render self.body).html_safe
  end


  private

# automatically be set to up vote an Answer after creation
  def create_vote
   user.answer_votes.create(value: 1, answer: self)
  end

  #automatically follow any question that you leave an answer for
  def create_follow
    user.follow_questions.create(question: self.question)
  end

  # send emails to anyone following a question when a new answer is left.
  # do not email the user that left the question
  # do not email any user that wishs not to receive following emails
  # which is a preference they can set in their user settings panel
  def send_following_emails
    self.question.follow_questions.each do | follow |
      if follow.user_id != self.user_id && follow.user.email_follows?
        FollowQuestionMailer.new_answer(follow.user, self.question, self).deliver
      end
    end
  end
  handle_asynchronously :send_following_emails, queue: 'email_answers', run_at: Proc.new { 5.minute.from_now }

end
