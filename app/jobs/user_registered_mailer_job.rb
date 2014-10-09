class UserRegisteredMailerJob < ActiveJob::Base
  queue_as :email

  def perform(user)
    UserMailer.registered(user).deliver_now
  end
end
