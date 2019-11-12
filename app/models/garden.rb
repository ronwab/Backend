# frozen_string_literal: true

class Garden < ApplicationRecord
  validates :plant_name, presence: true
  validates :plant_name, uniqueness: true
  validates :rows, :spacing, numericality: true

  has_many :garden_fertilizers
  has_many :fertilizers, through: :garden_fertilizers

  before_save :downcase_plant_name
  def downcase_plant_name
    self.plant_name = plant_name.downcase
  end
end
