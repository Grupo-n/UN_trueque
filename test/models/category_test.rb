# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "arte")
  end
  
  test "should be valid" do
		assert @category.valid?
	end
	
	test "wrong name" do
	  @category.name = ""
	  assert_not @category.valid?
	end
	
	test "other wrong name" do
	  @category.name = "       "
	  assert_not @category.valid?
	end
	  
  
end
