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
  
end
