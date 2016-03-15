class GendersController < ApplicationController
  before_action :set_gender, only: [:show, :edit, :update, :destroy]

  def index
    @genders = Gender.all
  end

  def show
  end

  def new
    @gender = Gender.new
  end

  def edit
  end

  def create
    @gender = Gender.new(gender_params)

    respond_to do |format|
      if @gender.save
        format.html { redirect_to @gender, notice: 'Gender was successfully created.' }
        format.json { render :show, status: :created, location: @gender }
      else
        format.html { render :new }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gender.update(gender_params)
        format.html { redirect_to @gender, notice: 'Gender was successfully updated.' }
        format.json { render :show, status: :ok, location: @gender }
      else
        format.html { render :edit }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gender.destroy
    respond_to do |format|
      format.html { redirect_to genders_url, notice: 'Gender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gender
      @gender = Gender.find(params[:id])
    end

    def gender_params
      params.require(:gender).permit(:gender)
    end
end
