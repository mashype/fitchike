class ConfirmationsController < ApplicationController
  before_action :set_confirmation, only: [:show, :edit, :update, :destroy]
  before_action :set_appointment
  before_action :authenticate_user!

  def index
    @confirmations = Confirmation.all
  end

  def show
  end

  def new
    @confirmation = Confirmation.new
  end

  def edit
  end

  def create
    @confirmation = Confirmation.new(confirmation_params)
    @confirmation.user_id = current_user.id
    @confirmation.appointment_id = @appointment.id


    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to @appointment, notice: 'Confirmation was successfully created.' }
        format.json { render :show, status: :created, location: @confirmation }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to @confirmation, notice: 'Confirmation was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmation }
      else
        format.html { render :edit }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @confirmation.destroy
    respond_to do |format|
      format.html { redirect_to confirmations_url, notice: 'Confirmation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_confirmation
      @confirmation = Confirmation.find(params[:id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def confirmation_params
      params.require(:confirmation).permit(:user_id, :appointment_id, :confirmation_temp)
    end
end
