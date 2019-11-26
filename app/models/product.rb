class Product < ApplicationRecord
  belongs_to :central, dependent: :destroy
  has_and_belongs_to_many :components
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus

  validates :name, presence: true
  validates :price, presence: true
end
