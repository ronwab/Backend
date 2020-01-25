# frozen_string_literal: true

class Fertilizer < ApplicationRecord
  validates :fertilizer_name, :quantity, :date_bought, presence: true
  validates :fertilizer_name, uniqueness: true
  has_many :garden_fertilizers
  has_many :gardens, through: :garden_fertilizers

  # before_save { self.fertilizer_name = self.fertilizer_name.downcase! }

  def self.search(search_params)
  where('Fertilizer_name LIKE?', "%#{search_params}%" )
  end
end
