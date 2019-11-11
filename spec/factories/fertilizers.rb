# frozen_string_literal: true

FactoryGirl.define do
  factory :fertilizer do
    fertilizer_name { Faker::Science.element }
    date_bought { Faker::Date.backward(days: 24) }
    quantity { Faker::Number.decimal(l_digits: 2) }
  end
end
