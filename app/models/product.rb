class Product < ApplicationRecord
<<<<<<< HEAD
=======

    belongs_to :user, optional: true

    has_attached_file :image, styles: { large:"450x450", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

>>>>>>> github/Oct04Gabriela
end
