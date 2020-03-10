# frozen_string_literal: true

class Garden < ApplicationRecord
  validates :plant_name, presence: true
  validates :plant_name, uniqueness: true
  validates :rows, :spacing, numericality: true

  has_many :garden_fertilizers
  has_many :fertilizers, through: :garden_fertilizers

  has_many :garden_activities
  # has_many :activities, through: :garden_activities

  has_many :harvests

  before_create :garden_exsistance_checker

  before_save :downcase_plant_name

  def downcase_plant_name
    plant_name.downcase!
  end

  def self.search_record(search_params)
    SearchRecord.perform(Garden, search_params, 'plant_name')
  end

  def garden_exsistance_checker
    ExistanceChecker.perform(plant_name, Garden, 'plant_name')
  end
end
