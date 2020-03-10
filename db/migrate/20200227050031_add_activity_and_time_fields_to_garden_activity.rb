# frozen_string_literal: true

class AddActivityAndTimeFieldsToGardenActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :garden_activities, :activity, :string
    add_column :garden_activities, :time, :string
  end
end
