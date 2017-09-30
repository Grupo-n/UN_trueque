class User < ApplicationRecord

  has_many :products
  has_many :services

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_attached_file :avatar, styles: { large:"450x400", medium: "300x300", thumb: "60x60" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image
      user.skip_confirmation!
    end
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver!
  end

end
