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
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
