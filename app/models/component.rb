class Component < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :central
  has_many :quantities

  validates :name, presence: true
  validates :cost, presence: true

  def as_json(*)
    super(include: :quantities)
  end
end
