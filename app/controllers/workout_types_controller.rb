class WorkoutTypesController < ApplicationController
  before_action :set_workout_type, only: [:show, :edit, :update, :destroy]

  # GET /workout_types
  # GET /workout_types.json
  def index
    @workout_types = WorkoutType.all
  end

  # GET /workout_types/1
  # GET /workout_types/1.json
  def show
  end

  # GET /workout_types/new
  def new
    @workout_type = WorkoutType.new
  end

  # GET /workout_types/1/edit
  def edit
  end

  # POST /workout_types
  # POST /workout_types.json
  def create
    @workout_type = WorkoutType.new(workout_type_params)

    respond_to do |format|
      if @workout_type.save
        format.html { redirect_to @workout_type, notice: 'Workout type was successfully created.' }
        format.json { render :show, status: :created, location: @workout_type }
      else
        format.html { render :new }
        format.json { render json: @workout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_types/1
  # PATCH/PUT /workout_types/1.json
  def update
    respond_to do |format|
      if @workout_type.update(workout_type_params)
        format.html { redirect_to @workout_type, notice: 'Workout type was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_type }
      else
        format.html { render :edit }
        format.json { render json: @workout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_types/1
  # DELETE /workout_types/1.json
  def destroy
    @workout_type.destroy
    respond_to do |format|
      format.html { redirect_to workout_types_url, notice: 'Workout type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_type
      @workout_type = WorkoutType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_type_params
      params.require(:workout_type).permit(:type_name)
    end
end
