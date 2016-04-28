class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
    @profiles = Profile.all.where(trainer: TRUE)
    
    @avg_reviews = []
    for singleprofile in @profiles
      @reviews = Review.where(profile_id: singleprofile.id)

      if @reviews.blank?
        @avg_reviews << 0
      else
        @avg_reviews << @reviews.average(:rating).round(2)
      end
    end
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
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        UserMailer.signup_confirmation(@profile).deliver
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }      
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
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
      params.require(:profile).permit(:user_id, :username, :bio, :dob, :trainer, :avatar, :gender_id,
      profile_locations_attributes: [:id, :profile_id, :location_id, :location_type_id, :_destroy, 
        location_attributes: [:id, :address_1, :address_2, :city, :state, :zip, :latitude, :longitude, :_destroy]],
      profile_certifications_attributes: [:id, :profile_id, :certification_id, :cert_year, :_destroy],
      profile_workouts_attributes: [:id, :profile_id, :workout_id, :rating, :_destroy])
    end
end


