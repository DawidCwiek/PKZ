class Central < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  has_many :stores
end
