class Building < ApplicationRecord
    has_many :apartments

    validates :number,     presence: true
end
