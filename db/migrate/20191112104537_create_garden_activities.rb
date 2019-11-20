# frozen_string_literal: true

class CreateGardenActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_activities do |t|
      t.date :date_performed
      t.string :weather
      t.string :notes
      t.belongs_to :activity, null: false, foreign_key: true
      t.belongs_to :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
