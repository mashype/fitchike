class AppointmentsController < ApplicationController
	before_action :find_appointment, only: [:show, :edit, :update, :destroy]

	def index
		@appointments = Appointment.where(user_id: current_user)
	end

	def show
	end

	def new
		@appointment = current_user.appointments.build
	end

	def create
		@appointment = current_user.appointments.build(appointment_params)

		if @appointment.save
			redirect_to @appointment
		else
			render 'new'      
		end
	end

	def edit
	end

	def update
		if @appointment.update(appointment_params)
			redirect_to @appointment
		else
			render 'edit'
		end
	end

	def destroy
		@appointment.destroy
		redirect_to appointments_path
	end

	private

	def find_appointment
		@appointment = Appointment.find(params[:id])
	end

	def appointment_params
		params.require(:appointment).permit(:title, :comments, :price, :length, :date, :active, :profile_id)
	end
end
