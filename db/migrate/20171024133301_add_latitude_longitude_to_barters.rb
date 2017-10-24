class AddLatitudeLongitudeToBarters < ActiveRecord::Migration[5.1]
  def change
    unless column_exists? :barters, :latitude
      add_column :barters, :latitude, :float
    end
    unless column_exists? :barters, :latitude
      add_column :barters, :longitude, :float
    end
  end
end
