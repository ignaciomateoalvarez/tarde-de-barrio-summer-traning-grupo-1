require 'faker'

User.create(first_name: 'Cami', last_name: 'alumne', email: 'cami@gmail.com', password: '123', active: true, role: 0)
User.create(first_name: 'Charly', last_name: 'Alumne', email: 'charly@gmail.com', password: '123', active: true,
            role: 0)
User.create(first_name: 'Juan', last_name: 'Bottassi', email: 'juan@gmail.com', password: '123', active: true, role: 1)
User.create(first_name: 'Juli', last_name: 'mentora', email: 'juli@gmail.com', password: '123', active: true, role: 1)
User.create(first_name: 'Fere', last_name: 'dementor', email: 'fere@gmail.com', password: '123', active: true, role: 1)
User.create(first_name: 'Carla', last_name: 'Campetella', email: 'carla@gmail.com', password: '123', active: true,
            role: 1)
User.create(first_name: 'Nicolas', last_name: 'García', email: 'nico@gmail.com', password: '123', active: true, role: 1)

20.times do
  Student.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    birth: Faker::Date.birthday(min_age: 2, max_age: 30),
    address: Faker::Address.full_address,
    school_level: 1,
    goes_to_school: Faker::Boolean.boolean,
    user_id: 2
  )
end
