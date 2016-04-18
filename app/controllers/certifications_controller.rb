class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :edit, :update, :destroy]
  before_action :verify_is_admin

  def index
    @certifications = Certification.all
  end

  def show
  end

  def new
    @certification = Certification.new
  end

  def edit
  end

  def create
    @certification = Certification.new(certification_params)

    respond_to do |format|
      if @certification.save
        format.html { redirect_to @certification, notice: 'Certification was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @certification.update(certification_params)
        format.html { redirect_to @certification, notice: 'Certification was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @certification.destroy
    respond_to do |format|
      format.html { redirect_to certifications_url, notice: 'Certification was successfully destroyed.' }
    end
  end

  private
    def set_certification
      @certification = Certification.find(params[:id])
    end

    def certification_params
      params.require(:certification).permit(:cert_name)
    end

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end
end
