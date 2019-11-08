class Component < ApplicationRecord
  belongs_to :warehouse, dependent: :destroy
  has_and_belongs_to_many :product, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :warehouse_id }
  validates :quantity, presence: true
  validates :cost, presence: true
end
