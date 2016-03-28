class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all
  end

  def show
    @reviews = Review.where(profile_id: @profile.id).order("created_at DESC")
    @appointments = Appointment.where(profile_id: @profile.id).order("created_at DESC")    

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @profile = current_user.profiles.build
  end

  def edit
  end

  def create
    @profile = current_user.profiles.build(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :username, :bio, :zip, :avatar, :gender_id,
      profile_locations_attributes: [:id, :profile_id, :location_id, :location_type_id, :_destroy, 
        location_attributes: [:id, :address_1, :address_2, :city, :state, :zip, :latitude, :longitude, :_destroy]],
      profile_certifications_attributes: [:id, :profile_id, :certification_id, :cert_year, :_destroy],
      profile_workouts_attributes: [:id, :profile_id, :workout_id, :rating, :_destroy])
    end
end

