class Barter < ApplicationRecord

    has_many :products

    def self.offers(product)
      return Barter.where("product_one_id = ?", product.id)
    end


end
