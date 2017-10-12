class Product < ApplicationRecord

    belongs_to :user

    validates :name, presence: true
    validates :p_type, presence: true
    validates :description, presence: true, length: {maximum: 100}

    has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/

end
