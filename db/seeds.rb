# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = 'password'

User.destroy_all
Idea.destroy_all
Review.destroy_all


10.times.each do
  first_name= Faker::Name.first_name
  last_name= Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all


100.times.each do
   i = Idea.create(
     title: Faker::VentureBros.quote,
     description: Faker::VForVendetta.speech,
     user: users.sample
   )
   if i.valid?
   rand(0..10).times.each do
     Review.create(
       description: Faker::VForVendetta.quote,
       idea: i,
       user: users.sample
     )
   end
 end
 end
