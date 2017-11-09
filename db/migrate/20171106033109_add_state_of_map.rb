class AddStateOfMap < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :accept_user_one, :string , default: "false"
    add_column :barters, :accept_user_two, :string , default: "false"
  end
end
