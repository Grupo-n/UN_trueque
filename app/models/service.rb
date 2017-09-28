class Service < ApplicationRecord
    
    belongs_to :user
    
    validates :name, presence: true
    validates :description, presence: true, length: { in: 10..100}
    
end
