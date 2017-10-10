require 'test_helper'

class ChooseOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @choose_offer = choose_offers(:one)
  end

  test "should get index" do
    get choose_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_choose_offer_url
    assert_response :success
  end

  test "should create choose_offer" do
    assert_difference('ChooseOffer.count') do
      post choose_offers_url, params: { choose_offer: {  } }
    end

    assert_redirected_to choose_offer_url(ChooseOffer.last)
  end

  test "should show choose_offer" do
    get choose_offer_url(@choose_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_choose_offer_url(@choose_offer)
    assert_response :success
  end

  test "should update choose_offer" do
    patch choose_offer_url(@choose_offer), params: { choose_offer: {  } }
    assert_redirected_to choose_offer_url(@choose_offer)
  end

  test "should destroy choose_offer" do
    assert_difference('ChooseOffer.count', -1) do
      delete choose_offer_url(@choose_offer)
    end

    assert_redirected_to choose_offers_url
  end
end
