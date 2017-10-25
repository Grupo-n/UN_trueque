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
#  money          :integer
#  confirmation   :string
#  id_one_user    :integer          #Owner
#  id_two_user    :integer          #Offer
#

class Barter < ApplicationRecord

    has_many :products

    def self.offers(product)
      return Barter.where("product_one_id = ?", product.id)
    end

    def self.offers_received(user)
      return Barter.where("id_one_user = ?", user.id)
    end

    def self.offers_made(user)
      return Barter.where("id_two_user = ?", user.id)
    end

    def self.my_transactions(user)
      return Barter.where("(id_two_user = ? OR id_two_user = ?) AND state = '2'", user.id, user.id)
    end

end
