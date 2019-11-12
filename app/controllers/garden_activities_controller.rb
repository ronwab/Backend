class GardenActivitiesController < ApplicationController
  respond_to :json

  def index
    respond_with GardenActivity.all
  end

  def show
    respond_with my_garden_activity
  end

  def create
    new_garden_activity = GardenActivity.create!(garden_activities_params)

    respond_with new_garden_activity
  end

  def destroy
    my_garden_activity.destroy
    binding.pry
    # HOW WILL THIS WORK
    # respond_with json: { message: `#{@garden_activity.id} is destroyed`}
    respond_with json: { message: " Record is destroyed" }
  end

  private

  def my_garden_activity
    @garden_activity ||= GardenActivity.find(params[:id])
  end

  def garden_activities_params
    params.permit(:activity_id, :garden_id, :date_performed, :weather, :notes)
  end


end