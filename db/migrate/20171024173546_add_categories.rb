class AddCategories < ActiveRecord::Migration[5.1]
  def up

    #Productos
    Category.new(name: "Arte").save
    Category.new(name: "Libros y fotocopias").save
    Category.new(name: "Juegos y juguetes").save
    Category.new(name: "Salud y belleza").save
    Category.new(name: "Electrónica").save
    Category.new(name: "Ropa").save
    Category.new(name: "Música, películas y series").save
    Category.new(name: "Deportes").save
    Category.new(name: "Accesorios").save
    Category.new(name: "Vivienda").save
    Category.new(name: "Alimentos").save
    Category.new(name: "Mascotas").save
    Category.new(name: "Muebles y hogar").save

    #Servicios
    Category.new(name: "Tutorías").save
    Category.new(name: "Clases").save
    Category.new(name: "Trabajos").save

    Category.new(name: "Otros").save

  end
end
