# == Schema Information
#
# Table name: Barters
#
#  description :string
#  product_one_id         :integer
#  product_two_id     :integer
#  timestamps
#  t.belongs_to :users, index: true
#
 
class Barter < ApplicationRecord
    
    has_many :products
    
end
