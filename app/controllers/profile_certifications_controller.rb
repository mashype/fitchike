class ProfileCertificationsController < ApplicationController
  before_action :set_profile_certification, only: [:show, :edit, :update, :destroy]

  def index
    @profile_certifications = ProfileCertification.all
  end

  def show
  end

  # GET /profile_certifications/new
  def new
    @profile_certification = ProfileCertification.new
  end

  # GET /profile_certifications/1/edit
  def edit
  end

  # POST /profile_certifications
  # POST /profile_certifications.json
  def create
    @profile_certification = ProfileCertification.new(profile_certification_params)

    respond_to do |format|
      if @profile_certification.save
        format.html { redirect_to @profile_certification, notice: 'Profile certification was successfully created.' }
        format.json { render :show, status: :created, location: @profile_certification }
      else
        format.html { render :new }
        format.json { render json: @profile_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile_certification.update(profile_certification_params)
        format.html { redirect_to @profile_certification, notice: 'Profile certification was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_certification }
      else
        format.html { render :edit }
        format.json { render json: @profile_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile_certification.destroy
    respond_to do |format|
      format.html { redirect_to profile_certifications_url, notice: 'Profile certification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profile_certification
      @profile_certification = ProfileCertification.find(params[:id])
    end

    def profile_certification_params
      params.require(:profile_certification).permit(:cert_year)
    end
end
