class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy

    validates :name,     presence: true
    validates :address,  presence: true
    validates :city,     presence: true
end
