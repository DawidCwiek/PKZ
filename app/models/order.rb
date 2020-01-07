class Order < ApplicationRecord
  belongs_to :store
  has_and_belongs_to_many :products

  validates_presence_of :profit
  validates_presence_of :total_price

  def issued!
    update_attribute(:issued, true)
  end

  def as_json(*)
    super(include: :products)
  end
end
