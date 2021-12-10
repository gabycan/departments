class Building < ApplicationRecord
    has_many :apartments

    validates :number,         presence: true, numericality: true
    validates :building_id,    presence: true
end
