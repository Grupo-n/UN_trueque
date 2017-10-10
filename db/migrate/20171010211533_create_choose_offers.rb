class CreateChooseOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :choose_offers do |t|

      t.timestamps
    end
  end
end
