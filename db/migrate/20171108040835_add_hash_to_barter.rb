class AddHashToBarter < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :hash_facture, :string
    add_column :barters, :meeting_date, :date
    add_column :barters, :meeting_time, :time
  end
end
