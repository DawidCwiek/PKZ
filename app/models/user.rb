class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :password_digest, :name, :surname, :phone_number

  has_one :address, as: :addressable
  has_and_belongs_to_many :centrals
  has_many :workers
  has_many :stores, through: :workers
end
