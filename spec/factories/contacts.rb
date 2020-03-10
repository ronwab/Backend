# frozen_string_literal: true

FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    subject { Faker::Lorem.sentence(word_count: 3) }
    comment { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
