# frozen_string_literal: true

class CalcFertilizer
  def self.perform(quantity_applied, fertilizer)
    myfertilizer = fertilizer.quantity
    fertilizer.quantity = myfertilizer - quantity_applied
    fertilizer.save!
  end
end
