class FollowUserMailer < ActionMailer::Base
  default from: "alexhawkins.me@gmail.com"

  def new_auser(user)
    @user = user
    
  # New Headers
    headers["Message-ID"] = "<user/#{@user.id}@stakit.io>"
    headers["In-Reply-To"] = "<user/#{@user.id}@stakit.io>"
    headers["References"] = "<usern/#{@user.id}@stakit.io>"

    mail(to: user.email, subject: "#{user.name} is now following you!")
  end

end
