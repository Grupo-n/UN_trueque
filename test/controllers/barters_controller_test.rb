require 'test_helper'

class BartersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barter = barters(:one)
  end
  
  test "should be valid" do
		assert @barter.valid?
	end
=begin    
  test "should get index" do
    get barters_url
    assert_response :success
  end

  test "should get new" do
    get new_barter_url
    assert_response :success
  end

  test "should create barter" do
    assert_difference('Barter.count') do
      post barters_url, params: { barter: { description: @barter.description } }
    end

    assert_redirected_to barter_url(Barter.last)
  end

  test "should show barter" do
    get barter_url(@barter)
    assert_response :success
  end

  test "should get edit" do
    get edit_barter_url(@barter)
    assert_response :success
  end

  test "should update barter" do
    patch barter_url(@barter), params: { barter: { description: @barter.description } }
    assert_redirected_to barter_url(@barter)
  end

  test "should destroy barter" do
    assert_difference('Barter.count', -1) do
      delete barter_url(@barter)
    end

    assert_redirected_to barters_url
  end
=end
end
