# frozen_string_literal: true

class Fertilizer < ApplicationRecord
  validates :fertilizer_name, :quantity, :date_bought, presence: true
  # validates :fertilizer_name, uniqueness: true
  has_many :garden_fertilizers
  has_many :gardens, through: :garden_fertilizers

  before_save :downcase_fields
  before_create :check_fertilizer_existing

  def self.search(search_params)
    find_by('Fertilizer_name LIKE?', "%#{search_params}%")
  end

  private

  def downcase_fields
    fertilizer_name.downcase!
  end

  def check_fertilizer_existing
    ExistanceChecker.perform(fertilizer_name, Fertilizer, 'fertilizer_name')
  end
end
