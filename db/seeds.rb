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
User.create(first_name: "Juli", last_name: "mentora", email: "juli@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Fere", last_name: "dementor", email: "fere@gmail.com",password:'123', active: true, role: 0)

p "Creadas #{User.count} usuarios"

Student.create(name: 'Charly', lastname: 'Anabella', birth: '05/04/1994', address: 'Calle 314', school_level: 2, goes_to_school: true)
Student.create(name: 'Camila', lastname: 'Tisera', birth: '31/12/1998', address: 'Calle 12', school_level: 1, goes_to_school: true )