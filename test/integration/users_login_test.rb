require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "should register new user" do
    get new_user_registration_path #rails routes
    assert_response :success

    post user_registration_path, params: {user: {first_name: " " , last_name: " ", email: " ", password: " ", password_confirmation: " "}}

    #assert_redirected_to user_registration_path
    assert_template "devise/registrations/new"

    post user_registration_path, params: {user: {first_name: "Nico" , last_name: "Yeah", email: "123@correo.com", password: "12345678", password_confirmation: "12345678"}}
    assert_redirected_to :root
  end
end
