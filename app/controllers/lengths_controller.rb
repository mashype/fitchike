class LengthsController < ApplicationController
  before_action :set_length, only: [:show, :edit, :update, :destroy]

  # GET /lengths
  # GET /lengths.json
  def index
    @lengths = Length.all
  end

  # GET /lengths/1
  # GET /lengths/1.json
  def show
  end

  # GET /lengths/new
  def new
    @length = Length.new
  end

  # GET /lengths/1/edit
  def edit
  end

  # POST /lengths
  # POST /lengths.json
  def create
    @length = Length.new(length_params)

    respond_to do |format|
      if @length.save
        format.html { redirect_to @length, notice: 'Length was successfully created.' }
        format.json { render :show, status: :created, location: @length }
      else
        format.html { render :new }
        format.json { render json: @length.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lengths/1
  # PATCH/PUT /lengths/1.json
  def update
    respond_to do |format|
      if @length.update(length_params)
        format.html { redirect_to @length, notice: 'Length was successfully updated.' }
        format.json { render :show, status: :ok, location: @length }
      else
        format.html { render :edit }
        format.json { render json: @length.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lengths/1
  # DELETE /lengths/1.json
  def destroy
    @length.destroy
    respond_to do |format|
      format.html { redirect_to lengths_url, notice: 'Length was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_length
      @length = Length.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def length_params
      params.require(:length).permit(:appointment_length)
    end
end
