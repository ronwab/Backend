FactoryGirl.define do
  factory :garden_activity do
    date_performed "2019-11-12"
    weather "Hot"
    notes "Test notes"
    activity "Planting"
    garden_id 1
    activity_id 1
  end

end

#
#
# FactoryGirl.define do
#   factory :fertilizer do
#     fertilizer_name { Faker::Science.element }
#     date_bought { Faker::Date.backward(days: 24) }
#     quantity { Faker::Number.decimal(l_digits: 2) }
#   end
# end