class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def car
    redirect_to 'vehicles?utf8=✓&q[kind_cont]=Car&q[make_cont]=&q[model_cont]=&q[price_gteq]=0&q[price_lteq]=99999&q[year_gteq]=0&q[year_lteq]=2050&commit=Search'
  end
  def truck
     @vehicles = Vehicle.all
  end

  def suv
     @vehicles = Vehicle.all
  end

  def van
     @vehicles = Vehicle.all
  end
  
  # GET /vehicles
  # GET /vehicles.json
  def index      
      @q = Vehicle.ransack(params[:q])
      @vehicles= @q.result(distinct: true)
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:kind, :status, :model, :title, :price, :make, :year, :body_style, :mileage, :exterior_color, :interior_color, :engine, :transmission, :drive_type, :vehicle_class, :mpg, :trim, :fuel_type, :stereo, :doors, :stock_number, :vin_num, :thumb, :description, :other_options, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6, :image_6, :image_7, :image_8, :image_9, :image_10, :image_11, :image_12, :image_13, :image_14, :image_15, :image_16, :image_17, :image_18, :image_19, :image_20, :image_21, :image_22, :image_23, :image_24)
    end
end
