class AddAttachmentImageServiceToServices < ActiveRecord::Migration[4.2]
  def self.up
    change_table :services do |t|
      t.attachment :image_service
    end
  end

  def self.down
    remove_attachment :services, :image_service
  end
end
