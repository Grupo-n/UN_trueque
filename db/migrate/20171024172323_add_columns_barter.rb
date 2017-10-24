class AddColumnsBarter < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :money, :integer
  end
end
