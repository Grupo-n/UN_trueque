class AddColumnsProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :category, :integer
    add_column :products, :duration, :time
    add_column :products, :interests, :integer
    add_column :products, :available, :boolean
    add_column :products, :quantity, :integer
    add_column :products, :state, :boolean
  end
end
