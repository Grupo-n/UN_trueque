# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
include ActiveModel::Model
include ActiveModel::Conversion
include ActiveModel::Validations

attr_accessor :name, :email, :content

validates :name,
  presence: true

validates :email,
  presence: true

validates :content,
  presence: true
end
