# frozen_string_literal: true

10.times do
  Fertilizer.create(
    fertilizer_name: Faker::Science.element,
    date_bought: Faker::Date.backward(days: 14),
    quantity: Faker::Number.decimal(l_digits: 2)
  )
end

10.times do
  Garden.create(
    plant_name: Faker::Food.vegetables,
    date_planted: Faker::Date.backward(days: 14),
    rows: Faker::Number.decimal(l_digits: 2),
    spacing: Faker::Number.decimal(l_digits: 2),
    notes: Faker::TvShows::Simpsons.quote
  )
end
