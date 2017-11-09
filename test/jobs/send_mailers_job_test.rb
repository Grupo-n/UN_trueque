require 'test_helper'

class SendMailersJobTest < ActiveJob::TestCase
  
  test 'perform' do
    assert_no_enqueued_jobs
    SendMailersJob.perform_later(barters(:one), users(:nicolas), users(:two))
    #BillingJob.perform_now(account, product)
    #assert account.reload.charged_for?(product)
    assert_enqueued_jobs 1
  end
  
  #def perform(barter, user_one, user_two)
  #  UserMailer.calification_email(barter, user_one, user_two).deliver_now
  #end
end
