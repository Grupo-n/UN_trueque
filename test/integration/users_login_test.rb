require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "should register new user" do
    get user_registration_path #rails routes
    #assert_response :success
    
    post user_registration_path, params: {user: {first_name: " " , last_name: " ", email: " ", password: " ", password_confirmation: " "}}
    
    #assert_redirected_to user_registration_path
    assert_template 'devise/registration/new'
  end
end
