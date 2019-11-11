# frozen_string_literal: true

class GardenFertilizer < ApplicationRecord
  belongs_to :fertilizer
  belongs_to :garden

  validates :garden_id, :fertilizer_id, presence: true

  after_commit :resolve_fertilizer_count, only: [:create]

  private

  def resolve_fertilizer_count
    CalcFertilizer.peform(quantity_applied, fertilizer)
  end
end
