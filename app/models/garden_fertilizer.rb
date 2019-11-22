# frozen_string_literal: true

class GardenFertilizer < ApplicationRecord
  belongs_to :fertilizer
  belongs_to :garden

  validates :garden_id, :fertilizer_id, presence: true

  after_commit :resolve_fertilizer_count, on: %i[create update]
  before_save :check_fertilizer_quantity

  private

  def check_fertilizer_quantity
    return unless fertilizer.quantity < quantity_applied
    raise ArgumentError, "Applied Quantity of #{quantity_applied} cant be greater than available #{fertilizer.quantity} "

  end

  def resolve_fertilizer_count
    CalcFertilizer.perform(quantity_applied, fertilizer)
    Rails.logger.info " #{fertilizer.quantity}"
  end
end
