class Store < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  belongs_to :central, dependent: :destroy
  has_many :workers
  has_many :users, through: :workers
  has_many :orders

  validates :name, presence: true

  def as_json(*)
    super(include: [:address])
  end
end
