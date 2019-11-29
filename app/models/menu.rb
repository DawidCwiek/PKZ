class Menu < ApplicationRecord
  belongs_to :central
  has_and_belongs_to_many :products
  validates :name, uniqueness: { scope: :central_id }, presence: true
end
