class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index    
    # Esta pesquisa foi customizada para retornar o paciente indicador
    @patients = Patient.list_with_indication_name
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit    
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)    

    respond_to do |format|
      if @patient.save
        format.html { redirect_to edit_patient_path(@patient), notice: t(:register_created) }        
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        #format.html { redirect_to patients_path, notice: t(:register_updated) }
        format.html { redirect_to edit_patient_path(@patient), notice: t(:register_created) }        
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      # Esta pesquisa foi customizada para retornar o paciente indicador
      @patient = Patient.edit_with_indication_name(params[:id])
      @indication_patient_name = @patient.indication_patient_name
      @addresses = Address.where(patient_id: params[:id])
      @phones = Phone.where(patient_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:patient, :birth, :nationality, :marital_status_id, :indication_patient_id, :health_plan_id, :email)
    end
end
