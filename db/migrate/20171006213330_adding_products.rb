class AddingProducts < ActiveRecord::Migration[5.1]
  
  require 'faker'
  
  def up
    if User.count > 0
      $i = 0
      $u = User.find(1)
      while $i < 20 do
        p = Product.new
        p.name = Faker::Commerce.product_name
        p.p_type = rand(1..2)
        p.description = Faker::Commerce.department(2)
        p.user = $u
        p.save
        $i += 1
      end
    end
  end
  
end
