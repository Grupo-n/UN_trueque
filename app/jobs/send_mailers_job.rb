class SendMailersJob < ApplicationJob
  queue_as :default

  def perform(barter, user_one, user_two)
    UserMailer.calification_email(barter, user_one, user_two).deliver_now
  end
end
