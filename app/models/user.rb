class User < ApplicationRecord
  
  has_many :products
  has_many :services
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
