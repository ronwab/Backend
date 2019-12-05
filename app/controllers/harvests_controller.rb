# frozen_string_literal: true

class HarvestsController < ApplicationController
  respond_to :json

  def index
    myHarvests = Harvest.all
    if myHarvests.count == 0
      raise ArgumentError, 'Nothing to harvest'
      # render json: {message: "Nothing harvested"}
    else
      respond_with(myHarvests)
    end
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def create
    myHarvest = Harvest.create(harvest_params)
    respond_with myHarvest
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def update
    harvest.update!(harvest_params)
  rescue ActiveRecord::RecordInvalid => e
    handle_errors(e)
  end

  def destroy
    harvest.destroy!
    respond_with json: { message: 'Record Deleted' }
  end

  def handle_errors(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def harvest
    @harvest ||= Harvest.find(params[:id])
  end

  def harvest_params
    params.permit(:id, :date_harvested, :quantity, :harvest_number, :notes, :garden_id)
  end
end
