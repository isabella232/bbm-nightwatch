FactoryBot.define do
  factory :subscriber do
    sequence(:email) { |n| "subscriber#{n}@example.com" }
    sequence(:name) { |n| "John Doe Nr. #{n}" }
  end
end
