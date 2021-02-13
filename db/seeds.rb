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
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'rentmygarden',
    )
  user.save
end
puts "Created #{User.count} sample users"

puts 'Creating sample gardens'
  Garden.create(
    name: "Garden with pool",
    description: "Garden with a small pool in Seville",
    location: "Seville, Spain",
    price: 100,
    user: User.all.sample
    )

  Garden.create(
    name: "Small Garden",
    description: "Small garden in the heart of Paris",
    location: "Rue Saint-Dominique, Paris",
    price: 70,
    user: User.all.sample
    )

  Garden.create(
    name: "Large Field",
    description: "Large field in Sussex with plenty of space to throw a party",
    location: "Bashurst Hill, Horsham",
    price: 500,
    user: User.all.sample
    )

  Garden.create(
    name: "Large Garden",
    description: "Large garden in South Kensington with plent of space for a BBQ",
    location: "South Kensington, London",
    price: 140,
    user: User.all.sample
    )

  Garden.create(
    name: "Garden with a trampoline",
    description: "Garden ideal for family's with a trampoline for childen and adults to play",
    location: "Brixton, London",
    price: 80,
    user: User.all.sample
    )

  Garden.create(
    name: "Beautiful Garden",
    description: "A stunning Garden in Lyon with beautiful flowers",
    location: "Lyon, France",
    price: 60,
    user: User.all.sample
    )

  Garden.create(
    name: "Rooftop Garden",
    description: "A rooftop garden in Madrid, ideal for a drinks party",
    location: "Madrid, Spain",
    price: 110,
    user: User.all.sample
    )

  Garden.create(
    name: "Garden with hot tub",
    description: "A garden with a hot tub in the heart of Amsterdam",
    location: "Amsterdam, Netherlands",
    price: 110,
    user: User.all.sample
    )

  Garden.create(
    name: "Garden with beach views",
    description: "A garden in Barcelona with views of the Beach",
    location: "Barcelona, Spain",
    price: 110,
    user: User.all.sample
    )

puts "Created #{Garden.count} sample gardens"
puts "Seed complete"
