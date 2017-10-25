class AddLatitudeLongitudeToBarters < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :latitude, :float, default: 4.635487

    add_column :barters, :longitude, :float, default: -74.082719

  end
end
