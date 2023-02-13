require 'faker'

FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    lastname { Faker::Name.lastname }
    birth { Faker::Date.birthday }
    address { Faker::Address.street_address }
    school_level {'primary'}
    go_to_school {'yes'}
  end
end