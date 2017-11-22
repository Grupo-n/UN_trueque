require 'faker'

User.create(email: "joagranadosme@unal.edu.co", first_name: "Jonathan",
  last_name: "Granados Méndez", password: "12345678",
   password_confirmation: "12345678", score: 5.0)

User.create(email: "gsuarezc@unal.edu.co", first_name: "Gabriela",
  last_name: "Suárez Carvajal", password: "12345678",
   password_confirmation: "12345678", score: 5.0)

User.create(email: "jaasuarezga@unal.edu.co", first_name: "Jairo",
  last_name: "Suárez Garnica", password: "12345678",
   password_confirmation: "12345678", score: 5.0)

User.create(email: "macortesn@unal.edu.co", first_name: "Miguel Angel",
  last_name: "Cortes Nivia", password: "12345678",
   password_confirmation: "12345678", score: 5.0)

User.create(email: "jnsastoquee@unal.edu.co", first_name: "Nicolas",
  last_name: "Sastoque", password: "12345678",
   password_confirmation: "12345678", score: 5.0)

User.all.each do |d|
  d.confirmed_at=Time.now
  d.save
end

#Products
Category.create(name: "Arte")
Category.create(name: "Libros y fotocopias")
Category.create(name: "Juegos y juguetes")
Category.create(name: "Salud y belleza")
Category.create(name: "Electrónica")
Category.create(name: "Ropa")
Category.create(name: "Música, películas y series")
Category.create(name: "Deportes")
Category.create(name: "Accesorios")
Category.create(name: "Vivienda")
Category.create(name: "Alimentos")
Category.create(name: "Mascotas")
Category.create(name: "Muebles y hogar")

#Services
Category.create(name: "Tutorías")
Category.create(name: "Clases")
Category.create(name: "Trabajos")

Category.create(name: "Otros")

#Creating Products
for i in 0..30
  Product.create(name: Faker::Commerce.product_name, p_type: rand(1..2),
  description: Faker::Commerce.department(2), available: true, quantity: 1,
  created_at: Faker::Time.between(2.months.ago, Date.today, :all), state: true,
  user: User.find(rand(1..5)), category: rand(1..15), interests: rand(1..15),
  duration: Faker::Time.between(2.months.ago, Date.today, :all))
end
