class AddColumnsConfirmationBarter < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :confirmation, :string
  end
end
