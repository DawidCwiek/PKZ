class Central < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  has_many :products
  has_many :stores
  has_and_belongs_to_many :users
  has_many :menu
  after_create :add_warehouse

  # rubocop:disable Style/SymbolArray
  def as_json(*)
    super(include: [:address, :stores, users: { only: [:id, :email, :name, :surname, :phone_number] }])
  end
  # rubocop:enable Style/SymbolArray

  private

  def add_warehouse
    create_warehouse
  end
end
