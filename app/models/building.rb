class Building < ApplicationRecord
    before_save :set_capitalize
    has_many :apartments, dependent: :destroy

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
