class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show,:set_sold, :edit, :update, :destroy]

  def index     
      @all_vehicles = Vehicle.all.where.not(:status => "Sold")
      @q = Vehicle.all.where.not(:status => "Sold").ransack(params[:q])
      @vehicle= @q.result()
      @vehicles=@vehicle.order(:price).page params[:page]
      @vehicle=@vehicles
  end

  def show
    @vehicleCurr = Vehicle.find(params[:id])
    count=@vehicleCurr.countclicks
    if(!admin_signed_in?)
      if (@vehicleCurr.countclicks.blank?)
        count = 0
      end
    count = count + 1
    @vehicleCurr.update_attributes(:countclicks=> count)
    end
  end
  
  def new
    @vehicle = Vehicle.new
  end

  def edit
  end

def vin
end

def set_sold

    @vehicle.update_attributes(:status => "Sold")
     respond_to do |format|
      format.js 
    end
end
def set_pending
    @vehicle = Vehicle.all.find(params[:id])

    @vehicle.update_attributes(:status => "Pending")
     respond_to do |format|
      format.html { redirect_to '/admin/dashboard' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
end
def set_sale
    @vehicle = Vehicle.all.find(params[:id])

    @vehicle.update_attributes(:status => "Sale")
     respond_to do |format|
      format.html { redirect_to '/admin/dashboard' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
end
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


 def destroy
    @vehicle.destroy
      respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:kind, :status, :model, :title, :price,
       :make, :year, :body_style, :mileage, :exterior_color, :interior_color,
       :engine, :transmission, :drive_type, :vehicle_class, :mpg, :trim,
       :fuel_type, :stereo, :doors, :stock_number, :vin_num, :thumb, :description,
       :other_options, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6,
       :image_6, :image_7, :image_8, :image_9, :image_10, :image_11, :image_12,
       :image_13, :image_14, :image_15, :image_16, :image_17, :image_18, :image_19,
       :image_20, :image_21, :image_22, :image_23, :image_24, {vehicle_images: []}, :vehicle_images, :vehicle_images_cache, :import)
    end
end