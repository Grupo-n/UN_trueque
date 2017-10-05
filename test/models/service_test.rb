# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  duration    :time
#  typeInt     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
