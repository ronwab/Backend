# frozen_string_literal: true

FactoryGirl.define do
  factory :garden_fertilizer do
    quantity_applied { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    fertilizer_id { Faker::Invoice.reference }
    garden_id { Faker::Invoice.reference }
    notes { Faker::TvShows::Simpsons.quote }
    date_applied { Faker::Date.in_date_period(year: 2018, month: 2) }
  end
end
