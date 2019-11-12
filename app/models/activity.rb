# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :activity, presence: true
  # custom_validator
  validates_with StringValidator
end
