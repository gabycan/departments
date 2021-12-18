class Apartment < ApplicationRecord
  belongs_to :building

  validates :number,         presence: true, numericality: true
  validates :building_id,    presence: true
  validates :number,         uniqueness: { scope: :building_id }
    
end
