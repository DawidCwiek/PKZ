class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, dependent: :destroy

  validates :city, presence: true
  validates :zip_code, presence: true
  validates :street, presence: true
end
