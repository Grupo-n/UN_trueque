require 'faker'

User.create(email: "joagranadosme@unal.edu.co", first_name: "Jonathan",
  last_name: "Granados Méndez", password: "12345678", password_confirmation: "12345678")

#User.create(email: "gsuarezc@unal.edu.co", first_name: "Gabriela",
  #last_name: "Suárez Carvajal", password: "12345678", password_confirmation: "12345678")

#User.create(email: "jaasuarezg@unal.edu.co", first_name: "Jairo",
  #last_name: "Suárez Garnica", password: "12345678", password_confirmation: "12345678")

#User.create(email: "macortesn@unal.edu.co", first_name: "Miguel Angel",
  #last_name: "Cortes Nivia", password: "12345678", password_confirmation: "12345678")

#User.create(email: "jnsastoquee@unal.edu.co", first_name: "Nicolas",
  #last_name: "Sastoque", password: "12345678", password_confirmation: "12345678")

#Products
Category.new(name: "Arte")
Category.new(name: "Libros y fotocopias")
Category.new(name: "Juegos y juguetes")
Category.new(name: "Salud y belleza")
Category.new(name: "Electrónica")
Category.new(name: "Ropa")
Category.new(name: "Música, películas y series")
Category.new(name: "Deportes")
Category.new(name: "Accesorios")
Category.new(name: "Vivienda")
Category.new(name: "Alimentos")
Category.new(name: "Mascotas")
Category.new(name: "Muebles y hogar")

#Services
Category.new(name: "Tutorías")
Category.new(name: "Clases")
Category.new(name: "Trabajos")

Category.new(name: "Otros")

#Creating Products
for i in 0..30
  Product.create(name: Faker::Commerce.product_name, p_type: rand(0..1),
  description: Faker::Commerce.department(2), available: true, quantity: 1,
  created_at: Faker::Time.between(2.months.ago, Date.today, :all), state: true,
  user: User.find(1), category: rand(1..15), interests: rand(1..15))
end
