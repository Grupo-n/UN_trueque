require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "should register new user" do
    get "/welcome/index"
    assert_response :success
    
    #post "/", params: {user: {first_name: " " , last_name: " ", email: " ", password: " ", password_confirmation: " "}}
    
    #assert_redirected_to "/"
  end
end
