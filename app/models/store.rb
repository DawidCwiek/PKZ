class Store < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  belongs_to :central, dependent: :destroy
end
