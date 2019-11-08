class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :password_digest

  has_one :address, as: :addressable
  has_and_belongs_to_many :centrals
end
