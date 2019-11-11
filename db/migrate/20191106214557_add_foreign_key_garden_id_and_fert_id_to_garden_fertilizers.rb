# frozen_string_literal: true

class AddForeignKeyGardenIdAndFertIdToGardenFertilizers < ActiveRecord::Migration[6.0]
  def change
    add_column :garden_fertilizers, :garden_id, :integer
    add_column :garden_fertilizers, :fertilizer_id, :integer

    add_foreign_key :garden_fertilizers, :fertilizers
    add_foreign_key :garden_fertilizers, :gardens
  end
end
