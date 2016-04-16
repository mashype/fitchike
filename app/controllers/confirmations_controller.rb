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
    @confirmation = Confirmation.new confirmation_params.merge(email: stripe_params["stripeEmail"], card_token: stripe_params["stripeToken"])
    @confirmation.user_id = current_user.id
    @confirmation.appointment_id = @appointment.id
    raise "Please, check registration errors" unless @confirmation.valid?
    @confirmation.process_payment stripe_params['stripeToken']
    @confirmation.save
    redirect_to @appointment, :notice => 'Confirmation was successfully updated.'


  rescue Exception => e
    flash[:error] = e.message
    render :new
  end

  def update
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to @confirmation, notice: 'Confirmation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @confirmation.destroy
    respond_to do |format|
      format.html { redirect_to confirmations_url, notice: 'Confirmation was successfully destroyed.' }
    end
  end

  private
    def set_confirmation
      @confirmation = Confirmation.find(params[:id])
    end

    def stripe_params
      params.permit :stripeEmail, :stripeToken, :appointment_id, :utf8, :authenticity_token, :confirmation, :stripeTokenType, :confirmation
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def confirmation_params
      params.require(:confirmation).permit(:user_id, :appointment_id, :email, :card_token, :appointment_id, :confirmation_temp)
    end
end
