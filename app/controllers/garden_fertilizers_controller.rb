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

  # :fertilizer_amount,
  # :fertilizer_id,
  # :id
  #
  #  garden GET    /gardens/:id(.:format)                                                                   gardens#show
  #
  # def add_to_garden
  #   garden = Garden.find(garden_id)
  #   quantity = params[:quantity]
  #   fertilizer.apply_to_garden(garden, quantity)
  # end

  # On garden show page, the user selects the quantity and fertilizer
  # User hits submit
  # Submit triggers a POST request to `def create` with the parameters the user entered in

  def create
    # binding.pry
    #  GardenFertilizer.create(quantity: amount, garden_id: garden.id, fertilizer_id: self.id)
    garden_fertilizer = GardenFertilizer.create!(application_params)

    # fertilizer = garden_fertilizer.fertilizer
    # garden_fertilizer.fertilizer.subtract_from_total(amount)

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
