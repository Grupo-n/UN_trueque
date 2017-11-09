# == Schema Information
#
# Table name: barters
#
#  id              :integer          not null, primary key
#  description     :string
#  product_one_id  :integer
#  product_two_id  :integer
#  state           :integer
#  users_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  latitude        :float            default(4.635487)
#  longitude       :float            default(-74.082719)
#  money           :integer
#  confirmation    :string
#  id_one_user     :integer
#  id_two_user     :integer
#  title           :string
#  address         :text
#  accept_user_one :string           default("false")
#  accept_user_two :string           default("false")
#  hash_facture    :string
#  meeting_date    :date
#  meeting_time    :time
#

class Barter < ApplicationRecord

    has_many :products

    validate :meeting_not_in_past
    validate :product_two_equal_nil
    validates :product_one_id, presence: true

    geocoded_by :address
    after_validation :geocode, :if => :address_changed?

    def get_product_one
      Product.find(self.product_one_id)
    end

    def get_product_two
      Product.find(self.product_two_id)
    end

    def get_user_one
      User.find(self.id_one_user)
    end

    def get_user_two
      User.find(self.id_two_user)
    end

    def make_transaction
      self.state = 2
      self.get_product_one.update({:available=>false})
      self.get_product_two.update({:available=>false})
      self.save
    end

    def get_QR
      RQRCode::QRCode.new(Digest::MD5.hexdigest(self.get_product_one.id.to_s + "-" + self.get_product_two.id.to_s))
    end

    def get_Hash
      Digest::MD5.hexdigest(self.get_product_one.id.to_s + "-" + self.get_product_two.id.to_s)
    end

    def get_comments
      Comment.where(barter: self.id)
    end

    def self.offers(product)
      return Barter.where("product_one_id = ?", product.id)
    end

    def self.offers_received(user)
      return Barter.where("id_one_user = ? AND state = '1'", user.id, )
    end

    def self.offers_made(user)
      return Barter.where("id_two_user = ? AND state = '1'", user.id)
    end

    def self.my_transactions(user)
      return Barter.where("(id_one_user = ? OR id_two_user = ?) AND state = '2'", user.id, user.id)
    end

    def meeting_not_in_past
      if self.meeting_date < Date.today
        self.errors.add(:meeting_date, "No puede viajar en el tiempo we :v")
      end
    end

    def product_two_equal_nil
      if self.product_two_id.nil?
        self.errors.add(:product_two_id, "Debes escoger un producto")
      end
    end

end
