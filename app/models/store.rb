class Store < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  belongs_to :central, dependent: :destroy
  has_many :workers
  has_many :users, through: :workers
  has_many :orders
end
