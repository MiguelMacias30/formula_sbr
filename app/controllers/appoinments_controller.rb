class AppoinmentsController < ApplicationController
  before_action :set_appoinment, only: [:show, :edit, :update, :destroy]

  # GET /appoinments
  # GET /appoinments.json
  def index
    @appoinments = Appoinment.all
    #info_mail(
           #mail: 'miguelfernandomacias@gmail.com',
           #subject: 'bienvenido',
           #message: 'a tu vista de citas'
        #)
  end

  # GET /appoinments/1
  # GET /appoinments/1.json
  def show
  end

  # GET /appoinments/new
  def new
    @appoinment = Appoinment.new
  end

  # GET /appoinments/1/edit
  def edit
  end

  # POST /appoinments
  # POST /appoinments.json
  def create
    @appoinment = Appoinment.new(appoinment_params)
    @appoinment.user_id = current_user.id
    respond_to do |format|
      if @appoinment.save
        format.html { redirect_to @appoinment, notice: 'Appoinment was successfully created.' }
        format.json { render :show, status: :created, location: @appoinment }
      else
        format.html { render :new }
        format.json { render json: @appoinment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appoinments/1
  # PATCH/PUT /appoinments/1.json
  def update
    respond_to do |format|
      if @appoinment.update(appoinment_params)
        format.html { redirect_to @appoinment, notice: 'Appoinment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appoinment }
      else
        format.html { render :edit }
        format.json { render json: @appoinment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoinments/1
  # DELETE /appoinments/1.json
  def destroy
    @appoinment.destroy
    respond_to do |format|
      format.html { redirect_to appoinments_url, notice: 'Appoinment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appoinment
      @appoinment = Appoinment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appoinment_params
      params.require(:appoinment).permit(:day, :service_id, :user_id)
    end
end
