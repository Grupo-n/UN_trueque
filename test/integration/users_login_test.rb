require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Pantalla para registrar de usuarios en el sistema (primer y segundo nombre y password )

  test "should register new user" do

    post user_registration_path, params: {user: {first_name: "Nico" , last_name: "Yeah", email: "123@correo.com", password: "12345678", password_confirmation: "12345678"}}
    assert_redirected_to :root
  end


  # La cuenta se bloqueará después de 5 intentos de ingreso fallidos

  test "La cuenta se bloqueará después de 5 intentos de ingreso fallidos" do
    user = users(:tom)
    5.times { user.valid_for_authentication?{ false } }
    assert user.reload.access_locked?
  end

end
