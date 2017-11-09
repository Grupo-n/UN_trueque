require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  #test "should get new" do
  #  get comments_new_url
  #  assert_response :success
  #end
  setup do
    @comments = comments(:one)
  end
  
  test "should be valid" do
		assert @comments.valid?
	end

end
