require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @messages = messages(:one)
  end
  
  test "should be valid" do
		assert_not @messages.valid?
	end
end
