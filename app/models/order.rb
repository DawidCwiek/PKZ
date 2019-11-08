class Order < ApplicationRecord
  belongs_to :store

  validates_presence_of :profit
  validates_presence_of :total_price
  validates_presence_of :issued
end
