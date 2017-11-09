# == Schema Information
#
# Table name: products
#
#  id                         :integer          not null, primary key
#  name                       :string
#  p_type                     :integer
#  description                :string
#  users_id                   :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :integer
#  product_image_file_name    :string
#  product_image_content_type :string
#  product_image_file_size    :integer
#  product_image_updated_at   :datetime
#  category                   :integer
#  duration                   :time
#  interests                  :integer
#  available                  :boolean
#  quantity                   :integer
#  state                      :boolean
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup 
		@product = Product.new(name:"camara",
		                       p_type: 1,
		                       description: "una camara super profesional",
		                       user_id: users(:nicolas).id,
		                       product_image: sample_file()
		                       )
	end
	
	test "should be valid" do
		assert @product.valid?
	end
	
	test "description should be present" do
		@product.description = nil
		assert_not @product.valid?
	end
	
	test "user should exist" do
		@product.user_id = nil
		assert_not @product.valid?
	end
	
	test "p_type should be present" do
		@product.p_type = nil
		assert_not @product.valid?
	end
	
	test "maximum description lenght " do
		@product.description = 'x'*101
		assert_not @product.valid?
	end
	
end
