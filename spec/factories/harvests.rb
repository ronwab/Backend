# frozen_string_literal: true

FactoryGirl.define do
  factory :harvest do
    garden
    date_harvested { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    quantity { Faker::Number.within(range: 1..100) }
    harvest_number { Faker::Number.within(range: 1..100) }
    notes { Faker::TvShows::DrWho.quote }
  end
end
