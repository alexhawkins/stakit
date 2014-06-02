class FollowQuestionMailer < ActionMailer::Base
  default from: "alexhawkins.me@gmail.com"

  def new_answer(user, question, answer)
    @user = user
    @question = question
    @answer = answer
    
  # New Headers
    headers["Message-ID"] = "<answers/#{@answer.id}@stakit.io>"
    headers["In-Reply-To"] = "<question/#{@question.id}@stakit.io>"
    headers["References"] = "<question/#{@question.id}@stakit.io>"

    mail(to: user.email, subject: "New answer on #{question.name}")
  end

end
