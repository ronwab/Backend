class GardenActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :garden

  validates :date_performed, presence: true
end
