class Product < ApplicationRecord
  belongs_to :central, dependent: :destroy
  has_and_belongs_to_many :components
  has_and_belongs_to_many :orders

  validates :name, presence: true
  validates :price, presence: true
end
