# frozen_string_literal: true
class Activity < ApplicationRecord

  has_many :garden_activities
  has_many :garden, through: :garden_activities

  validates :activity, presence: true
  # custom_validator
  validates_with StringValidator
end
