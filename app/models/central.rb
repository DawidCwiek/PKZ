class Central < ApplicationRecord
  has_one :address, as: :addressable
end
