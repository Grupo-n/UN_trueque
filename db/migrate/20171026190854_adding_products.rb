class AddingProducts < ActiveRecord::Migration[5.1]

  require 'faker'

  def up

    u = User.new()
    u.id = 1
    u.first_name = "UN_trueque"
    u.last_name = "App"
    u.email = "un.truequeapp@gmail.com"
    u.save

    $i = 0
    while $i < 20 do
      p = Product.new
      p.name = Faker::Commerce.product_name
      p.p_type = rand(1..2)
      p.description = Faker::Commerce.department(2)
      p.user = u
      p.available = true
      p.created_at = Faker::Time.between(2.months.ago, Date.today, :all)
      p.category = rand(1..15)
      p.interests = rand(1..15)
      p.quantity = 1
      p.state = true
      p.save
      $i += 1
    end

  end

end
