class Quantity < ApplicationRecord
  has_one :component
  has_one :warehouse
end
