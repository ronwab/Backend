# frozen_string_literal: true

class FertilizersController < ApplicationController
  respond_to :json

  def index
    # binding.pry
    # Display fertilizers based by gardens
    respond_with @fertilizer = Garden.find(garden_id).fertilizers
  end

  def create
    new_fertilizer = Fertilizer.create!(fertilizer_params)
    respond_with(new_fertilizer)
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def update
    # binding.pry
    fertilizer.update(fertilizer_params)
    # binding.pry
    # respond_with fertilizer
    show
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in show method  #{e.message}"
    handle_errors(e)
  end

  def show
    respond_with fertilizer
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in show method  #{e.message}"
    handle_errors(e)
  end

  def destroy
    fertilizer.destroy
    render json: { "message": "Record with id #{fertilizer} destroyed" }
    Rails.logger.info "Deleted record with #{fertilizer}"
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in Delete method #{e.message}"
    handle_errors(e)
  end

  def fertilizer
    @fertilizer ||= Fertilizer.find(params[:id])
  end

  def handle_errors(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def garden_id
    params[:garden_id]
  end

  def fertilizer_params
    params.permit(:id, :fertilizer_name, :date_bought, :quantity)
  end
end
