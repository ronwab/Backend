# frozen_string_literal: true

class CreateReaches < ActiveRecord::Migration[6.0]
  def change
    create_table :reaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :subject
      t.text :comment

      t.timestamps
    end
  end
end
