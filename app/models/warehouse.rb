class Warehouse < ApplicationRecord
  has_many :components
  belongs_to :warehousable, polymorphic: true, dependent: :destroy
end
