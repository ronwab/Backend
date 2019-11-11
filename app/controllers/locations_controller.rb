# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    @locations = location.order
    # render json: { data: @locations }, status: :ok
  end

  def show
    location
    # render json: {data:location}, status: :ok
  end

  def new_location(_params)
    @location = Location.new
  end

  def create
    saved_location = new_location(location_params)
    if saved_location.save
      flash[:success] = 'Place added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def location
    @location ||= Location.find(params[:id])
  end

  private

  def location_params
    params.permit(:location, :latitude, :longitude, :visted_by)
  end
end
