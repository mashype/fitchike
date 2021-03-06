class AppointmentsController < ApplicationController
	before_action :find_appointment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index


#		@appointments = Appointment.all

		if params[:search].present?
      location_ids = Location.near(params[:search], 50, order: '').pluck(:id)
      @appointments = Appointment.includes(:location).where(location_id: location_ids)
    else
      location_ids = Location.near([session[:latitude], session[:longitude]], 50, order: '').pluck(:id)
      @appointments = Appointment.includes(:location).where(location_id: location_ids)
    end

		@avg_reviews = []
    for singleappointment in @appointments
      @reviews = Review.where(profile_id: singleappointment.profile.id)

      if @reviews.blank?
        @avg_reviews << 0
      else
        @avg_reviews << @reviews.average(:rating).round(2)
      end
    end

    @hash = Gmaps4rails.build_markers(@appointments) do |appointment, marker|
      marker.lat appointment.location.latitude
      marker.lng appointment.location.longitude
      marker.infowindow appointment.title
    end

  end

	def show
		@confirmations = Confirmation.where(appointment_id: @appointment.id).order("created_at DESC")
	end

	def new
		@appointment = current_user.appointments.build
	end

	def create
		@appointment = current_user.appointments.build(appointment_params)

		if @appointment.save
			UserMailer.appointment_confirmation(@appointment.profile).deliver
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
		@profile = Profile.where(id: @appointment.profile_id)
	end

	def appointment_params
		params.require(:appointment).permit(:title, :comments, :price, :end_date, :active, :length_id, :profile_id, :location_id)
	end
end

