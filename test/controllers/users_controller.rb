require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest


  # El sistema solo permitirá usar ciertas funcionalidades a usuarios registrados

  test 'should get page home, sign_in and sign_up and contact' do
    get welcome_index_path
    assert_response :success
    get new_user_session_path
    assert_response :success
    get new_user_registration_path
    assert_response :success
    get contact_path
    assert_response :success
  end

  test 'should not pages of the application' do
    get new_product_path
    assert_response :redirect
    get new_barter_path
    assert_response :redirect
    get myobjects_my_products_path
    assert_response :redirect
    get mytransactions_my_products_path
    assert_response :redirect
  end

end
