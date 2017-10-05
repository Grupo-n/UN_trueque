class Service < ApplicationRecord

    belongs_to :user, optional:true

    has_attached_file :image_service, styles: { large:"450x450", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image_service, content_type: /\Aimage\/.*\z/

end
