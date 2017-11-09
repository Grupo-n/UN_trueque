class AddHashToBarter < ActiveRecord::Migration[5.1]
  def change
    add_column :barters, :hash_facture, :string
  end
end
