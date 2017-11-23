require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  # La cuenta se bloqueará después de 5 intentos de ingreso fallidos
  test 'Account is blocked after 5 unsuccessful login attempts' do
    user = users(:tom)
    5.times { user.valid_for_authentication?{ false } }
    assert user.reload.access_locked?
  end

  # Screen to change the user's password. You must ask for the previous password and the new password
  # test 'Screen to change the user"s password. You must ask for the previous password and the new password' do
  #   @user = users(:tom)
  #   sign_in @user
  #   post edit_user_password_path,
  #     params: {
  #       user:
  #       {
  #         first_name: @user.first_name,
  #         last_name: @user.last_name,
  #         password: 'Qq123456789',
  #         password_confirmation: 'Qq123456789',
  #         current_password: 'Tom2017Tom'
  #       }
  #     }
  #   assert_response :root
  # end

end
