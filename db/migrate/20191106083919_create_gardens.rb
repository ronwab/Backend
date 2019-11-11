# frozen_string_literal: true

class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :plant_name
      t.date :date_planted
      t.integer :rows
      t.integer :spacing
      t.string :notes

      t.timestamps
    end
  end
end
