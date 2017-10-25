class AddUsersIdBarters < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :id_one_user, :integer
    add_column :barters, :id_two_user, :integer
  end
end
