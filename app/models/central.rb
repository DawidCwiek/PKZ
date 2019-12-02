class Central < ApplicationRecord
  has_one :address, as: :addressable
  has_one :warehouse, as: :warehousable
  has_many :products
  has_many :stores
  has_and_belongs_to_many :users
  has_many :menu
  after_create :add_warehouse

  private

  def add_warehouse
    create_warehouse
  end
end
