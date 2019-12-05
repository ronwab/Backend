# frozen_string_literal: true

class CreateHarvests < ActiveRecord::Migration[6.0]
  def change
    create_table :harvests do |t|
      t.date :date_harvested
      t.integer :quantity
      t.integer :harvest_number
      t.string :notes
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
