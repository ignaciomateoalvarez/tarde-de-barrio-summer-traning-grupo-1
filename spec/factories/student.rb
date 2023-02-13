require 'faker'

FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    lastname { Faker::Name.lastname }
    birth { Faker::Date.birthday }
    address { Faker::Address.street_address }
    school_level {'primary'}
    goes_to_school {'false'}
  end
end