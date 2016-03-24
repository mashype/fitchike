class ProfileWorkoutsController < ApplicationController
  before_action :set_profile_workout, only: [:show, :edit, :update, :destroy]

  # GET /profile_workouts
  # GET /profile_workouts.json
  def index
    @profile_workouts = ProfileWorkout.all
  end

  # GET /profile_workouts/1
  # GET /profile_workouts/1.json
  def show
  end

  # GET /profile_workouts/new
  def new
    @profile_workout = ProfileWorkout.new
  end

  # GET /profile_workouts/1/edit
  def edit
  end

  # POST /profile_workouts
  # POST /profile_workouts.json
  def create
    @profile_workout = ProfileWorkout.new(profile_workout_params)

    respond_to do |format|
      if @profile_workout.save
        format.html { redirect_to @profile_workout, notice: 'Profile workout was successfully created.' }
        format.json { render :show, status: :created, location: @profile_workout }
      else
        format.html { render :new }
        format.json { render json: @profile_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_workouts/1
  # PATCH/PUT /profile_workouts/1.json
  def update
    respond_to do |format|
      if @profile_workout.update(profile_workout_params)
        format.html { redirect_to @profile_workout, notice: 'Profile workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_workout }
      else
        format.html { render :edit }
        format.json { render json: @profile_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_workouts/1
  # DELETE /profile_workouts/1.json
  def destroy
    @profile_workout.destroy
    respond_to do |format|
      format.html { redirect_to profile_workouts_url, notice: 'Profile workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_workout
      @profile_workout = ProfileWorkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_workout_params
      params.require(:profile_workout).permit(:rating)
    end
end
