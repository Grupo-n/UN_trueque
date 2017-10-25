class AddMoreValuesToBarters < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :title, :string
    add_column :barters, :address, :text
  end
end
