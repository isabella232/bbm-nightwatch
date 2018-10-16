FactoryBot.define do
  factory :success_story do
    sequence(:title) { |i| "#{i}-dik Sikeres fankozas" }
    description { "Egyszeruen csak megtortent es csodalatos volt." }
    contributor { "Donut Heaven" }
  end
end