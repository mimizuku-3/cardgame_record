FactoryBot.define do
  factory :deck do
    sequence(:name) { |n| "デッキ#{n}" }
  end
end
