# == Schema Information
#
# Table name: barters
#
#  id              :integer          not null, primary key
#  description     :string
#  product_one_id  :integer
#  product_two_id  :integer
#  state           :integer
#  users_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  latitude        :float            default(4.635487)
#  longitude       :float            default(-74.082719)
#  money           :integer
#  confirmation    :string
#  id_one_user     :integer
#  id_two_user     :integer
#  title           :string
#  address         :text
#  accept_user_one :string           default("false")
#  accept_user_two :string           default("false")
#  hash_facture    :string
#

require 'test_helper'

class BarterTest < ActiveSupport::TestCase

  def setup
    @barter = barters(:one)
    
  end
  
  test "should be valid" do
		assert @barter.valid?
	end

	test "description without limit " do
		@barter.description = 'a'*10000
		assert @barter.valid?
	end

	test "confirmation without limit " do
		@barter.confirmation = 'a'*10000
		assert @barter.valid?
	end
=begin 
  test "products should be different" do
    @barter.product_one_id = 1
    @barter.product_two_id = 1
    debugger
    assert_not @barter.valid?
  end

  test "users should be different" do
    @barter.id_one_user = 1
    @barter.id_two_user = 1
    assert_not @barter.valid?
  end
=end
end
