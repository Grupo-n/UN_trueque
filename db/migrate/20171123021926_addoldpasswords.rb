class Addoldpasswords < ActiveRecord::Migration[5.1]
  def change
    create_table :old_passwords do |t|
      t.string :encrypted_password, :null => false
      t.string :password_archivable_type, :null => false
      t.integer :password_archivable_id, :null => false
      t.datetime :created_at
    end
  end
end
