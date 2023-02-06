require 'faker'

50.times do 
  first_name= Faker::Name.first_name
  last_name= Faker::Name.last_name
  full_name= first_name+last_name
  u= User.new(first_name: first_name, last_name: last_name, email: Faker::Internet.email(name: full_name),password:'123') 
  unless u.save
    puts u.errors.full_messages
  end
  
end

p "Creadas #{User.count} usuarios"
