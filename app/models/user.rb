# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  provider               :string
#  uid                    :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  score                  :decimal(, )
#

class User < ApplicationRecord

  after_create :send_welcome_email

  has_many :products
  has_many :services

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :confirmable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_attached_file :avatar, styles: { large:"450x400", medium: "300x300", thumb: "60x60" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = "https://graph.facebook.com/#{auth.uid}/picture?type=large"
      user.skip_confirmation!
    end
  end

  def self.get_name(product)
    return User.find(product.user_id).first_name + " " + User.find(product.user_id).last_name
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver!
  end

  def self.get_user(product)
    return User.find(product.user_id)
  end

end
