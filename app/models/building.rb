class Building < ApplicationRecord
    before_save :set_capitalize
    has_many :apartments
    has_one_attached :picture

    validates :name,     presence: true
    validates :address,  presence: true
    validates :city,     presence: true

    private
    def set_capitalize    
        self.name.capitalize!
        self.address.capitalize! 
        self.city.capitalize!
    end

end
