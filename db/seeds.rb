# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clearing databse'
Booking.destroy_all
Garden.destroy_all
User.destroy_all

puts 'Creating sample users'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'rentmygarden',
    )
  user.save
end
puts "Created #{User.count} sample users"

puts 'Creating sample gardens'
counter = 1
50.times do
  garden = Garden.new(
    name: "Garden #{counter}",
    description: Faker::Lorem.paragraph,
    location: Faker::Address.full_address,
    price: rand(10..500),
    user: User.all.sample
    )
  garden.save
  counter += 1
end

puts "Created #{Garden.count} sample gardens"
puts "Seed complete"
