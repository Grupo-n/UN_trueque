class CreateBarters < ActiveRecord::Migration[5.1]
  def change
    create_table :barters do |t|
      t.string :description
      t.integer :product_one_id
      t.integer :product_two_id
      t.integer :state
      
      t.belongs_to :users, index: true

      t.timestamps
    end
  end
end
