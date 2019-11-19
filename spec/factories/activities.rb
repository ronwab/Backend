# frozen_string_literal: true

FactoryGirl.define do
  factory :activity do
    activity { Faker::Verb.simple_present }

  end
end
