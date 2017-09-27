class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.time :duration
      t.integer :typeInt

      t.timestamps
    end
  end
end
