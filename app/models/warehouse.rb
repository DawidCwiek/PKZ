class Warehouse < ApplicationRecord
  belongs_to :warehousable, polymorphic: true, dependent: :destroy
end
