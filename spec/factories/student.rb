require 'faker'

FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    birth { Faker::Date.birthday }
    address { Faker::Address.street_address }
    school_level {1}
    goes_to_school {Faker::Boolean.boolean}
    user
  end
end