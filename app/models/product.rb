class Product < ApplicationRecord
    
    belongs_to :user
    
    validates :name, presence: true
    validates :t_product, presence: true
    validates :description, presence: true, length: {maximum: 100}
    
end
