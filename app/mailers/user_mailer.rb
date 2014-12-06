class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def registered(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rdaily!')
  end
end
