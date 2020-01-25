# frozen_string_literal: true

class FertilizersController < ApplicationController
  respond_to :json

  def search_fertilizer
    if search_params[:search].present?
      check_search_results
    else
      render json: { "message": ' Enter Fertilizer to search for' }
    end
  end

  def check_search_results
    @search_results = Fertilizer.where('fertilizer_name LIKE ?', "%#{search_params[:search].downcase}%")
    if @search_results.present?
      respond_with @search_results
    else
      render json: { "message": 'No results found Please enter another value' }, status: :Not_Found
    end
  end

  def index
    # returns all fertilizers
    respond_with @all_fertilizers = Fertilizer.all
  end

  def fertilized_gardens
    # Display fertilizers based by gardens
    respond_with @fertilizer = Fertilizer.find(fertilizer_params).fertilizers
  end

  def create
    new_fertilizer = Fertilizer.create!(fertilizer_params)
    respond_with(new_fertilizer)
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def update
    fertilizer.update(fertilizer_params)
    # Look at show below
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
    render json: {"message": "Record with id #{fertilizer} destroyed"}
    Rails.logger.info "Deleted record with #{fertilizer}"
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info "Error rescued in Delete method #{e.message}"
    handle_errors(e)
  end

  def fertilizer
    @fertilizer ||= Fertilizer.find(params[:id])
  end

  def handle_errors(e)
    render json: {error: e.message}, status: :unprocessable_entity
  end

  private

  def garden_id
    params[:garden_id]
  end

  def search_params
    params.permit(:search)
  end

  def fertilizer_params
    params.permit(:id, :fertilizer_name, :date_bought, :quantity)
  end
end
