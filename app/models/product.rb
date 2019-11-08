class Product < ApplicationRecord
  belongs_to :central, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
