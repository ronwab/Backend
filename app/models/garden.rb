# frozen_string_literal: true

class Garden < ApplicationRecord
  validates :plant_name, presence: true
  validates :plant_name, uniqueness: true
  validates :rows, :spacing, numericality: true

  has_many :garden_fertilizers
  has_many :fertilizers, through: :garden_fertilizers

  has_many :garden_activities
  has_many :activities, through: :garden_activities

  has_many :harvests

  # belongs_to :user

  before_save :downcase_plant_name
  def downcase_plant_name
    self.plant_name = plant_name.downcase
  end

  def self.search(search_params)
    where('plant_name LIKE ?', "%#{search_params}%")
  end
end
