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

class Product < ApplicationRecord

    belongs_to :user

    validates :name, presence: true
    validates :p_type, presence: true
    validates :description, presence: true, length: {maximum: 100}

    has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/

    def self.descendent
      return Product.all.order('created_at DESC')
    end

    def self.objects
      return Product.where("p_type = ?", 1)
    end

    def self.services
      return Product.where("p_type = ?", 2)
    end

    def self.get_user_by_product_id(product_id)
      return Product.find(product_id)
    end


end
