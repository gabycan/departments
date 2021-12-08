class Apartment < ApplicationRecord
  belongs_to :building

  validates :name,     presence: true
  validates :address,  presence: true
  validates :city,     presence: true
end
