# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  user       :integer
#  barter     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 
  def setup
    @comment = Comment.new()
  end
  
  test "should be valid" do
		assert @comment.valid?
	end
	
	test "content without limit " do
		@comment.content = 'a'*10000
		assert @comment.valid?
	end
	
	test "user and barter can be the same " do
		@comment.user = 123
		@comment.id = 123
		assert @comment.valid?
	end
	
end
