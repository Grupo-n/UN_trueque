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
		                       product_image: sample_file()
		                       )
	end
	
	test "should be valid" do
		assert @product.valid?
	end
end
