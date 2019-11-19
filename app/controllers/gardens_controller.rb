# frozen_string_literal: true

class GardensController < ApplicationController
  respond_to :json

  # ensure user is logged in before they can edit, delete create, or update.
  before_action :authenticate_user!, except: %i[show index]
  # GardenFertilizer.where(garden_id: 16)

  def fertilized_gardens
    # why is this ID and not fertilizer_id??
    respond_with @garden = Fertilizer.find(params[:id]).gardens
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def applied_fertilizers
    respond_with @garden = Garden.find(params[:id]).fertilizers
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    respond_with @garden = Garden.all
    #
    # ****** Why does this fail ??  Fertilizer.find(fertilizer_id).gardens || Garden.all
    # gardens = Garden.all || Fertilizer.find(fertilizer_id).gardens
    # respond_with gardens
  end

  def create
    # binding.pry
    new_garden = Garden.create!(garden_params)
    respond_with(new_garden)
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def show
    respond_with garden
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in show method  #{e.message}"
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    garden.destroy
    render json: { "message": "Record with id #{garden} destroyed" }
    Rails.logger.info "Deleted record with #{garden}"
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in Delete method #{e.message}"
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def garden
    @garden ||= Garden.find(params[:id])
  end

  private

  def fertilizer_id
    params[:fertilizer_id]
  end

  def garden_params
    params.permit(:id, :plant_name, :date_planted, :rows, :spacing, :notes)
  end
end
