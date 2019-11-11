# frozen_string_literal: true

FactoryGirl.define do
  factory :garden do
    plant_name { Faker::Food.vegetables }
    date_planted { Faker::Date.backward(days: 25) }
    rows { Faker::Number.decimal(l_digits: 2) }
    spacing { Faker::Number.decimal(l_digits: 2) }
    notes { Faker::TvShows::Simpsons.quote }
  end
end
