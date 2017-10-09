class CreateMyPublications < ActiveRecord::Migration[5.1]
  def change
    create_table :my_publications do |t|

      t.timestamps
    end
  end
end
