class Warehouse < ApplicationRecord
  belongs_to :warehousable, polymorphic: true
  has_many :quantities
end
