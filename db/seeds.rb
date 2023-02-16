require 'faker'

# 50.times do 
#   first_name= Faker::Name.first_name
#   last_name= Faker::Name.last_name
#   full_name= first_name+last_name
#   u= User.new(first_name: first_name, last_name: last_name, email: Faker::Internet.email(name: full_name),password:'123',deactivated: false) 
#   unless u.save
#     puts u.errors.full_messages
#   end
  
# end

User.create(first_name: "Gianlucas", last_name: "Galati", email: "gianlucas@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Carla", last_name: "Ibel", email: "carla@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Juan", last_name: "Bottassi", email: "juan@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Juli", last_name: "mentora", email: "juli@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Fere", last_name: "dementor", email: "fere@gmail.com",password:'123', active: true, role: 0)

30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'asdasd'
  )
end


30.times do
  Student.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    birth: Faker::Date.birthday(min_age: 2, max_age: 30),
    address: Faker::Address.full_address,
    school_level: 1,
    goes_to_school: Faker::Boolean.boolean
  )
end
