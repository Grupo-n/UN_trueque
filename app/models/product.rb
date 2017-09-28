class Product < ApplicationRecord
    
    belongs_to :user, optional: true
    
    validates :name, presence: true
    validates :description, presence: true, length: { in: 10..100}
    
    
end
