FactoryBot.define do
  factory :transport do
    name { "John Doe" }
    email { "john@example.com" }
    phone { "555-5555" }
    donation factory: :donation, status: 'assigned'
    transporter factory: :user
  end
end
