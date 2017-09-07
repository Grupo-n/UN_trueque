require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get principal" do
    get static_pages_principal_url
    assert_response :success
  end

end
