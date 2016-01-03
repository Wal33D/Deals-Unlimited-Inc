class MeetsController < ApplicationController
  before_action :set_meet, only: [:show, :edit, :update, :destroy]

  def index
    @meets = Meet.all
  end


  def show
  end

  def new
    @meet = Meet.new
  end

  def edit
  end

  def create
    @meet = Meet.new(meet_params)

    respond_to do |format|
      if @meet.save
        format.html { redirect_to @meet, notice: 'Meet was successfully created.' }
        format.json { render :show, status: :created, location: @meet }
      else
        format.html { render :new }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meet.update(meet_params)
        format.html { redirect_to @meet, notice: 'Meet was successfully updated.' }
        format.json { render :show, status: :ok, location: @meet }
      else
        format.html { render :edit }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meet.destroy
    respond_to do |format|
      format.html { redirect_to meets_url, notice: 'Meet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_meet
      @meet = Meet.find(params[:id])
    end

    def meet_params
      params.require(:meet).permit(:employee_name, :headshot, {headshot_images: []}, :headshot_images_cache,:duration, :about, :position)
    end
end
