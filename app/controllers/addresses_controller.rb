class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  def list_address_patient
    @addresses = Address.where(patient_id: params[:patient_id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    if params[:origin] = 'patient'
      @address = Address.create(address_params)    
    else
      @address = Address.new(address_params)    
      respond_to do |format|
        if @address.save
          format.html { redirect_to @address, notice: 'Address was successfully created.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    if params[:origin] = 'patient'
      @address.update_attributes(address_params)
    else
      respond_to do |format|
        if @address.update(address_params)
          format.html { redirect_to @address, notice: 'Address was successfully updated.' }
          format.json { render :show, status: :ok, location: @address }
        else
          format.html { render :edit }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def delete
    @address = Address.find(params[:address_id])
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy    
    @address.destroy
    unless params[:origin] = 'patient'
      respond_to do |format|
        format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:patient_id, :street, :street_number, :complement, :neighborhood, :zip, :city_id)
    end
end
