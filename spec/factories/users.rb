FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    password { 's0m3pa55' }
    password_confirmation { 's0m3pa55' }
    confirmed_at { Time.now }
    name { 'John' }
    phone { '555 55-55' }
  end
end
