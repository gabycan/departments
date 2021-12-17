class ApartmentsController < ApplicationController
  layout 'admin_layout'
  before_action :set_apartment, only: %i[ show edit update destroy ]

  # GET /apartments or /apartments.json
  def index
    #@apartments = Apartment.all
    @apartments = Apartment.includes(:building)
  end

  # GET /apartments/1 or /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new                #select * from building
    @buildings = Building.select(:id, :name)  #select id, name from buildings
  end

  # GET /apartments/1/edit
  def edit
    @buildings = Building.select(:id, :name)
  end

  # POST /apartments or /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        @buildings = Building.select(:id, :name)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1 or /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        @buildings = Building.select(:id, :name)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    rescue
      flash[:set_apartment_error] = "Could not find the record #{params[:id]}"
      redirect_to apartments_path
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:number, :building_id)
    end
end
