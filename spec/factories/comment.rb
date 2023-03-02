FactoryBot.define do
  factory :comment do
    comment { 'MyText' }
    highlight { false }

    association :student

    trait :highlighted do
      highlight { true }
    end
  end
end
