class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show,:set_sold, :edit, :update, :destroy]

  def index     
      @q = Vehicle.where.not(:status => "Sold").ransack(params[:q])
      @vehicles =  @q.result().order(:price).page params[:page]
  end
  
  def image_gallery
     fetch_images
  end
  
  def show
    image_gallery
    view_counter
    status_init
    view_selector
  end
  
  def view_selector
     if mobile_device? 
      render 'vehicles/show_mobile'
    else 
      render 'vehicles/show'
    end
  end

  def view_counter 
      if !admin_signed_in?
         count = @vehicle.countclicks
         if @vehicle.countclicks.blank? 
           count = 0 
         end
      @vehicle.update_attributes(:countclicks=> (count += 1))
    end
  end

  def status_init
   if @vehicle.status == "Sale" 
      @status_phrase = "For Sale"
      @status_head = '<div class="panel-heading status_head" id="edit_status_panel_heading" style="background-color:rgba(0, 230, 118, 1);">'
      @status_head_show = 'background-color:white!important; color:#5383D3;'

    elsif @vehicle.status == "Pending" 
      @status_phrase = @vehicle.status
      @status_head = '<div class="panel-heading status_head"  id="edit_status_panel_heading" style="background-color:#5383D3;">'
      @status_head_show = 'background-color:#5383D3!important; color:white;'

    elsif @vehicle.status == "Sold" 
      @status_phrase = @vehicle.status
      @status_head = '<div class="panel-heading status_head" id="edit_status_panel_heading" style="background-color:#F44336;">'
      @status_head_show = 'background-color:#F44336!important; color:white;'
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit  
  end
  
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }

        image = MiniMagick::Image.open("public/"+@vehicle.vehicle_images[0].url)

        image.shave '10x55' 
        image.resize "118x66"

        image.format "png"
        image.write("public/images/thumbs/admin_thumbs/#{@vehicle.id}.png")  
        image.write("app/assets/images/thumbs/admin_thumbs/#{@vehicle.id}.png")  
        File.chmod(0644,"public/images/thumbs/admin_thumbs/#{@vehicle.id}.png")
        @vehicle.update_attributes(:admin_thumb => "thumbs/admin_thumbs/#{@vehicle.id}.png" )
       
        image2 = MiniMagick::Image.open("public/"+@vehicle.vehicle_images[0].url)
        image2.shave '0x60' # Removes 46px from top and bottom edges
        image2.resize "392x293"
        image2.format "png"
        image2.write("public/images/thumbs/#{@vehicle.id}.png")  
        image2.write("app/assets/images/thumbs/#{@vehicle.id}.png")  
        File.chmod(0644,"public/images/thumbs/#{@vehicle.id}.png")
        @vehicle.update_attributes(:thumb => "thumbs/#{@vehicle.id}.png")  

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
       :fuel_type, :stereo, :doors, :stock_number, :vin_num, :thumb,:admin_thumb, :description,
       :other_options, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6,
       :image_6, :image_7, :image_8, :image_9, :image_10, :image_11, :image_12,
       :image_13, :image_14, :image_15, :image_16, :image_17, :image_18, :image_19,
       :image_20, :image_21, :image_22, :image_23, :image_24, {vehicle_images: []}, :vehicle_images, :vehicle_images_cache, :import)
    end

    def fetch_images
      @path=""
      if @vehicle.import=="import"
              @path="../images/"

        if @vehicle.image_1
         img_tag = @vehicle.image_1
        end
        if @vehicle.image_2
         img_tag = img_tag + "," +  @vehicle.image_2
        end
        if @vehicle.image_3
         img_tag = img_tag + "," +  @vehicle.image_3
        end
        if @vehicle.image_4
         img_tag = img_tag + "," +  @vehicle.image_4
        end
        if @vehicle.image_5
         img_tag = img_tag + "," +  @vehicle.image_5
        end
        if @vehicle.image_6
         img_tag = img_tag + "," +  @vehicle.image_6
        end
        if @vehicle.image_7
         img_tag = img_tag + "," +  @vehicle.image_7
        end
        if @vehicle.image_8
         img_tag = img_tag + "," +  @vehicle.image_8
        end
        if @vehicle.image_9
         img_tag = img_tag + "," +  @vehicle.image_9
        end
        if @vehicle.image_10
         img_tag = img_tag + "," +  @vehicle.image_10
        end
        if @vehicle.image_11
         img_tag = img_tag + "," +  @vehicle.image_11
        end
        if @vehicle.image_12
         img_tag = img_tag + "," +  @vehicle.image_12
        end
        if @vehicle.image_13
         img_tag = img_tag + "," +  @vehicle.image_13
        end
        if @vehicle.image_14
         img_tag = img_tag + "," +  @vehicle.image_14
        end
        if @vehicle.image_15
             img_tag = img_tag + "," +  @vehicle.image_15
        end
        if @vehicle.image_16
             img_tag = img_tag + "," +  @vehicle.image_16
        end
        if @vehicle.image_17
             img_tag = img_tag + "," +  @vehicle.image_17
        end
        if @vehicle.image_18
             img_tag = img_tag + "," +  @vehicle.image_18
        end
        if @vehicle.image_18
             img_tag = img_tag + "," +  @vehicle.image_19
        end
        if @vehicle.image_18
             img_tag = img_tag + "," +  @vehicle.image_20
        end
        if @vehicle.image_18
             img_tag = img_tag + "," +  @vehicle.image_21
        end
        if @vehicle.image_18
             img_tag = img_tag + "," +  @vehicle.image_22
        end
       @vehicle_images = img_tag.split(",")
    else
       @vehicle_images = @vehicle.vehicle_images_urls
    end

end
end