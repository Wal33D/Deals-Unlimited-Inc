class CreditAppLockersController < ApplicationController
  before_action :set_credit_app_locker, only: [:show, :edit, :update, :destroy]

  # GET /credit_app_lockers
  # GET /credit_app_lockers.json
  def index
    @credit_app_lockers = CreditAppLocker.all
  end

  # GET /credit_app_lockers/1
  # GET /credit_app_lockers/1.json
  def show
  end

  # GET /credit_app_lockers/new
  def new
    @credit_app_locker = CreditAppLocker.new
  end

  # GET /credit_app_lockers/1/edit
  def edit
  end

  # POST /credit_app_lockers
  # POST /credit_app_lockers.json
  def create
    @credit_app_locker = CreditAppLocker.new(credit_app_locker_params)

    respond_to do |format|
      if @credit_app_locker.save
        format.html { redirect_to @credit_app_locker, notice: 'Credit app locker was successfully created.' }
        format.json { render :show, status: :created, location: @credit_app_locker }
      else
        format.html { render :new }
        format.json { render json: @credit_app_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_app_lockers/1
  # PATCH/PUT /credit_app_lockers/1.json
  def update
    respond_to do |format|
      if @credit_app_locker.update(credit_app_locker_params)
        format.html { redirect_to @credit_app_locker, notice: 'Credit app locker was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_app_locker }
      else
        format.html { render :edit }
        format.json { render json: @credit_app_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_app_lockers/1
  # DELETE /credit_app_lockers/1.json
  def destroy
    @credit_app_locker.destroy
    respond_to do |format|
      format.html { redirect_to credit_app_lockers_url, notice: 'Credit app locker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_app_locker
      @credit_app_locker = CreditAppLocker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_app_locker_params
      params.require(:credit_app_locker).permit(:name)
    end
end
