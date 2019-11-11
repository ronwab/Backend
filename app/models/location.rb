# frozen_string_literal: true

class Location < ApplicationRecord
  attr_accessor :address, :latitude, :longitude
  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?
  # if: ->(obj){ obj.address.present? and obj.address_changed? }

  def full_address
    [country, city, street].compact.join(',')
  end
end
