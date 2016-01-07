class ContactStoresController < ApplicationController
  before_action :set_contact_store, only: [:show, :edit, :update, :destroy]

  # GET /contact_stores
  # GET /contact_stores.json
  def index
    @contact_stores = ContactStore.all
  end

  # GET /contact_stores/1
  # GET /contact_stores/1.json
  def show
  end

  # GET /contact_stores/new
  def new
    @contact_store = ContactStore.new
  end

  # GET /contact_stores/1/edit
  def edit
  end

  # POST /contact_stores
  # POST /contact_stores.json
  def create
    @contact_store = ContactStore.new(contact_store_params)

    respond_to do |format|
      if @contact_store.save
        format.html { redirect_to @contact_store, notice: 'Contact store was successfully created.' }
        format.json { render :show, status: :created, location: @contact_store }
      else
        format.html { render :new }
        format.json { render json: @contact_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_stores/1
  # PATCH/PUT /contact_stores/1.json
  def update
    respond_to do |format|
      if @contact_store.update(contact_store_params)
        format.html { redirect_to @contact_store, notice: 'Contact store was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_store }
      else
        format.html { render :edit }
        format.json { render json: @contact_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_stores/1
  # DELETE /contact_stores/1.json
  def destroy
    @contact_store.destroy
    respond_to do |format|
      format.html { redirect_to contact_stores_url, notice: 'Contact store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_store
      @contact_store = ContactStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_store_params
      params.require(:contact_store).permit(:name, :email, :tel, :message, :date_time, :nickname, :utf8, :authenticity_token, :commit)
        
    end
end
