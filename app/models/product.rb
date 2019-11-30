class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :central, dependent: :destroy
  has_and_belongs_to_many :components
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus

  validates :name, presence: true
  validates :price, presence: true

  def image_url
    if self.image.attached?
      Rails.application.routes.url_helpers.rails_blob_path(self.image, only_path: true)
    else
      nil
    end
  end

  def as_json(options={})
    super(methods: :image_url, include: :components)
  end
end
