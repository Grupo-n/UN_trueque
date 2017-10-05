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

class Service < ApplicationRecord
    
    belongs_to :user, optional:true
    
    
end
