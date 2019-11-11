# frozen_string_literal: true

class CreateGardenFertilizers < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_fertilizers do |t|
      t.integer :quantity_applied
      t.date :date_applied
      t.string :notes

      t.timestamps
    end
  end
end
