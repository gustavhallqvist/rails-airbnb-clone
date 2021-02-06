# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating sample users'
10.times do
  User.new(
    email: Faker::Internet.email,
    password: 'rentmygarden',
    )
end

puts 'Creating sample gardens'
counter = 1
100.times do
  Garden.new(
    name: "Garden #{counter}",
    description: Faker::Lorem.paragraph,
    location: Faker::Address.full_address,
    price: rand(10..500),
    )
  counter += 1
end

puts "Seed complete"
