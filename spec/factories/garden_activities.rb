# frozen_string_literal: true

FactoryGirl.define do
  factory :garden_activity do
    # acrivity and garden are from the garden and activity controllers
    activity
    garden
    date_performed '2019-11-12'
    weather 'Hot'
    notes 'Test notes'
  end
end
