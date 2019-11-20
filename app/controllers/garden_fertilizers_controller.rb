# frozen_string_literal: true

class GardenFertilizersController < ApplicationController
  respond_to :json

  def index
    if all_applied_fertilizer.present?
      respond_with all_applied_fertilizer
    else
      render json: { "message": 'No Fertilizer Records' }
    end
  end

  def create
    garden_fertilizer = GardenFertilizer.create!(application_params)
    respond_with(garden_fertilizer)
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def show
    respond_with applied_fertilizer
  rescue ActiveRecord::RecordNotFound => e
    handle_errors(e)
  end

  def destroy
    applied_fertilizer.destroy
  rescue ActiveRecord::RecordNotFound => e
    handle_errors(e)
  end

  def update
    applied_fertilizer.update(application_params)
    render json: { message: "Activity for #{params[:garden_id]} has been updated" }
  rescue ActiveRecord::RecordNotFound => e
    handle_errors(e)
  end

  def all_applied_fertilizer
    @applied_fertilizer = GardenFertilizer.all
  end

  def applied_fertilizer
    @applied_fertilizer ||= GardenFertilizer.find(params[:id])
  end

  def handle_errors(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def application_params
    params.permit(:id, :garden_id, :fertilizer_id, :date_applied, :quantity_applied, :notes)
  end
end
