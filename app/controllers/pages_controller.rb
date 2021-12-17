class BuildingsController < ApplicationController
    layout 'admin_layout'
    
  
    # GET /buildings or /buildings.json
    def index
      @buildings = Building.all
      @apartments = Apartment.includes(:building)
    end
end