class Product < ApplicationRecord
    
    belongs_to :user
    
    validates :name, presence: true
    validates :p_type, presence: true
    validates :description, presence: true, length: {maximum: 100}
    
end
