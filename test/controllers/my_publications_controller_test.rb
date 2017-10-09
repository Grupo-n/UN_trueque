require 'test_helper'

class MyPublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_publication = my_publications(:one)
  end

  test "should get index" do
    get my_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_my_publication_url
    assert_response :success
  end

  test "should create my_publication" do
    assert_difference('MyPublication.count') do
      post my_publications_url, params: { my_publication: {  } }
    end

    assert_redirected_to my_publication_url(MyPublication.last)
  end

  test "should show my_publication" do
    get my_publication_url(@my_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_publication_url(@my_publication)
    assert_response :success
  end

  test "should update my_publication" do
    patch my_publication_url(@my_publication), params: { my_publication: {  } }
    assert_redirected_to my_publication_url(@my_publication)
  end

  test "should destroy my_publication" do
    assert_difference('MyPublication.count', -1) do
      delete my_publication_url(@my_publication)
    end

    assert_redirected_to my_publications_url
  end
end
