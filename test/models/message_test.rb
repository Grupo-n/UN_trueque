# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
  	@message = Message.new(name:"pedro",
  												email: "una@prueba.com",
  												content: "prueba de mensaje")
  end
	
	test "should be valid" do
		assert @message.valid?
	end
	
	test "wrong name" do
		@message.name = "         "
		assert_not @message.valid?
	end

	test "wrong email" do
		@message.email = " "
		assert_not @message.valid?
	end
	
	test "wrong content" do
		@message.content = "    "
		assert_not @message.valid?
	end
	
	test "email addresses can be the same" do
		duplicate_user = @message.dup
		duplicate_user.email = @message.email.upcase
		@message.save
		assert duplicate_user.valid?
	end
  
	test "content doesn't have a minimum length" do
		@message.content = "a"
		assert @message.valid?
	end
	
end
