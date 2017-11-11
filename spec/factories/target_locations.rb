FactoryBot.define do
  factory :target_location do
    sequence(:name) { |i| "Homeless Shelter #{i}" }
    address "11. Somewhere street"
    contact_name "Joe Contact"
    phone "+36 90 555-5555"
    email "target@example.com"
    category "fapad"
    capacity 100
    winter_capacity 10
    notes "MyText"
  end
end
