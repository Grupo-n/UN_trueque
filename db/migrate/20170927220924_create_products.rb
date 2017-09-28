class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :img
      t.integer :typeInt

      t.timestamps
    end
  end
end
