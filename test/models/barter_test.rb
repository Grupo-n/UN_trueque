# == Schema Information
#
# Table name: barters
#
#  id             :integer          not null, primary key
#  description    :string
#  product_one_id :integer
#  product_two_id :integer
#  state          :integer
#  users_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  latitude       :float            default(4.635487)
#  longitude      :float            default(-74.082719)
#  money          :integer
#  confirmation   :string
#  id_one_user    :integer
#  id_two_user    :integer
#  title          :string
#  address        :text
#

require 'test_helper'

class BarterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
