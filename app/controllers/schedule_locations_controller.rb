class ScheduleLocationsController < ApplicationController
  before_action :set_schedule_location, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  # GET /schedule_locations
  # GET /schedule_locations.json
  def index
    @schedule_locations = ScheduleLocation.where(location_id: @location.id)
  end

  # GET /schedule_locations/1
  # GET /schedule_locations/1.json
  def show
  end

  # GET /schedule_locations/new
  def new
    @schedule_location = ScheduleLocation.new
  end

  # GET /schedule_locations/1/edit
  def edit
  end

  # POST /schedule_locations
  # POST /schedule_locations.json
  def create
    @schedule_location = ScheduleLocation.new(schedule_location_params)

    respond_to do |format|
      if @schedule_location.save
        format.html { redirect_to location_schedule_locations_path(@location), notice: 'Schedule location was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_location }
      else
        format.html { render :new }
        format.json { render json: @schedule_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_locations/1
  # PATCH/PUT /schedule_locations/1.json
  def update
    respond_to do |format|
      if @schedule_location.update(schedule_location_params)
        format.html { redirect_to location_schedule_locations_path(@location), notice: 'Schedule location was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_location }
      else
        format.html { render :edit }
        format.json { render json: @schedule_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_locations/1
  # DELETE /schedule_locations/1.json
  def destroy
    @schedule_location.destroy
    respond_to do |format|
      format.html { redirect_to location_schedule_locations_url, notice: 'Schedule location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_location
      @schedule_location = ScheduleLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_location_params
      params.require(:schedule_location).permit(:location_id, :open, :close, :day_of_week)
    end

    def set_location
      @location = Location.find(params[:location_id])
    end
end
