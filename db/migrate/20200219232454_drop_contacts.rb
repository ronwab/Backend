# frozen_string_literal: true

class DropContacts < ActiveRecord::Migration[6.0]
  def change
    drop_table :Reaches
  end
end
