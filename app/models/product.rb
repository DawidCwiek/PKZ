class Product < ApplicationRecord
  belongs_to :central, dependent: :destroy
  has_and_belongs_to_many :component

  validates :name, presence: true
  validates :price, presence: true
end
