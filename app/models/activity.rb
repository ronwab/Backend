# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :garden_activities
  has_many :gardens, through: :garden_activities

  validates :activity, presence: true
  # custom_validator
  validates_with StringValidator
end
