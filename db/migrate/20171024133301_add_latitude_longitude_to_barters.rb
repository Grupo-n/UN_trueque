class AddLatitudeLongitudeToBarters < ActiveRecord::Migration[5.1]
  def change
    unless column_exists? :barters, :latitude
      add_column :barters, :latitude, :float, default: 4.635487
    end
    unless column_exists? :barters, :latitude
      add_column :barters, :longitude, :float, default: -74.082719
    end
  end
end
