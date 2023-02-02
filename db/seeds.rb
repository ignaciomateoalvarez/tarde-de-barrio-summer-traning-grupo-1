require 'faker'

10.times do 
  first_name= Faker::Name.first_name
  last_name= Faker::Name.last_name
  full_name= first_name+last_name
  User.create!(first_name: first_name, last_name: last_name, mail: Faker::Internet.email(name: full_name)) 
end

p "Creadas #{User.count} usuarios"
