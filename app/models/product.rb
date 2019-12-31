class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :central
  has_and_belongs_to_many :components
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus

  validates :name, presence: true
  validates :price, presence: true

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end

  def as_json(*)
    super(methods: :image_url, include: :components)
  end
end
