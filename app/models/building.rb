class Building < ApplicationRecord
    has_many :apartments

    validates :name,     presence: true
    validates :address,  presence: true
    validates :city,     presence: true
end
