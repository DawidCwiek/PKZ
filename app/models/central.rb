class Central < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  has_one :warehouse, as: :warehousable, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_and_belongs_to_many :users
  has_many :menu, dependent: :destroy
  has_many :components, dependent: :destroy
  after_create :add_warehouse

  # rubocop:disable Style/SymbolArray
  def as_json(*)
    super(include: [:address, stores: { include: :address }, users: { only: [:id, :email, :name, :surname, :phone_number] }])
  end
  # rubocop:enable Style/SymbolArray

  private

  def add_warehouse
    create_warehouse
  end
end
