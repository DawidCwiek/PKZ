class Menu < ApplicationRecord
  belongs_to :central
  validates :name, uniqueness: { scope: :central_id }  
end
