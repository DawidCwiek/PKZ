class Component < ApplicationRecord
  belongs_to :warehouse, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :cost, presence: true
end
