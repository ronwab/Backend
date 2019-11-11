# frozen_string_literal: true

class AddVisitedByColumToLocationsModel < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :visited_by, :string
  end
end
