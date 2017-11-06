FactoryBot.define do
  factory :donation do
    contact_name "John Doe"
    contact_phone "555 55-55"
    source_name "Food factory Ltd."
    source_address "11. Somewhere road, Neverville"
    food_type "Bread"
    available_from Time.now
    available_to 4.hours.from_now
    quantity 51
    not_perishable true
    user
  end
end
