class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string  :content
      t.integer :user
      t.integer :barter

      t.timestamps
    end
  end
end
