# frozen_string_literal: true

class CreateFertilizers < ActiveRecord::Migration[6.0]
  def change
    create_table :fertilizers do |t|
      t.string :fertilizer_name
      t.date :date_bought
      t.integer :quantity

      t.timestamps
    end
  end
end
