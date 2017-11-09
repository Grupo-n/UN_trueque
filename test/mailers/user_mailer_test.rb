require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "welcome" do
    
    email = UserMailer.welcome_email(users(:nicolas))
    
    assert_emails 1 do
      email.deliver_now
    end
    
    assert_equal ['un.truequeapp@gmail.com'], email.from
    assert_equal [users(:nicolas).email], email.to
    assert_equal 'Bienvenido a UNTrueque', email.subject
    #assert_equal read_fixture('invite').join, email.body.to_s
  end
  
  test "message" do
    email = UserMailer.new_message(messages(:one))
    
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal "Message contact from #{messages(:one).name}", email.subject
  end

  test "barter" do
    email = UserMailer.new_barter(barters(:one),products(:one),users(:nicolas),users(:two))
    
    assert_emails 1 do
      email.deliver_now
    end
    
    assert_equal [users(:nicolas).email], email.to
    assert_equal 'Recibiste una nueva oferta', email.subject
  end

=begin
  test "acceptoffer" do
    email = UserMailer.acceptoffer_email(barters(:one),users(:nicolas),users(:two))
    
    assert_emails 2 do
      email.deliver_now
    end
    
    assert_equal [users(:nicolas).email], email.to
    assert_equal 'Se ha realizado un trueque', email.subject
    assert_equal [users(:two).email], email.to
    assert_equal 'Se ha realizado un trueque', email.subject
  end
=end

  test "calification" do
    email = UserMailer.calification_email(barters(:one),users(:nicolas),users(:two))
    
    assert_emails 1 do
      email.deliver_now
    end
    
    assert_equal [users(:two).email], email.to
    assert_equal 'Califica al usuario con el que realizaste una transacción ', email.subject
  end

end