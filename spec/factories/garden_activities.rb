# frozen_string_literal: true

FactoryGirl.define do
  factory :garden_activity do
    # acrivity and garden are from the garden and activity controllers
    activity { Faker::Verb.past_participle }
    garden { Faker::IDNumber.brazilian_id }
    date_performed { Faker::Date.backward(days: 24) }
    weather 'Hot'
    notes { Faker::Quote.most_interesting_man_in_the_world }
  end
end
