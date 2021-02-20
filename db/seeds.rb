require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clearing databse'
Review.destroy_all
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
  garden_1 = Garden.create(
    name: "Garden with pool",
    description: "Garden with a small pool in Seville",
    location: "Seville, Spain",
    price: 100,
    user: User.all.sample
    )
  garden_1.image.attach(io: URI.open('https://i.pinimg.com/originals/a8/1e/06/a81e06228752f2212359a1cb3f708cdf.jpg'), filename: "garden_1.jpg")

  garden_2 = Garden.create(
    name: "Small Garden",
    description: "Small garden in the heart of Paris",
    location: "Rue Saint-Dominique, Paris",
    price: 70,
    user: User.all.sample
    )
  garden_2.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_2.jpg")

  garden_3 = Garden.create(
    name: "Large Field",
    description: "Large field in Sussex with plenty of space to throw a party",
    location: "Bashurst Hill, Horsham",
    price: 500,
    user: User.all.sample
    )
  garden_3.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_3.jpg")

  garden_4 = Garden.create(
    name: "Cozy Garden",
    description: "Cozy garden in South Kensington ideal for a BBQ",
    location: "South Kensington, London",
    price: 140,
    user: User.all.sample
    )
  garden_4.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_4.jpg")

  garden_5 = Garden.create(
    name: "Garden with a trampoline",
    description: "Garden ideal for family's with a trampoline for childen and adults to play",
    location: "Brixton, London",
    price: 80,
    user: User.all.sample
    )
  garden_5.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_5.jpg")

  garden_6 = Garden.create(
    name: "Beautiful Garden",
    description: "A stunning Garden in Lyon with beautiful flowers",
    location: "Lyon, France",
    price: 60,
    user: User.all.sample
    )
  garden_6.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_6.jpg")

  garden_7 = Garden.create(
    name: "Rooftop Garden",
    description: "A rooftop garden in Madrid, ideal for a drinks party",
    location: "Madrid, Spain",
    price: 110,
    user: User.all.sample
    )
  garden_7.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_7.jpg")

  garden_8 = Garden.create(
    name: "Garden with hot tub",
    description: "A garden with a hot tub in the heart of Amsterdam",
    location: "Amsterdam, Netherlands",
    price: 110,
    user: User.all.sample
    )
  garden_8.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_8.jpg")

  garden_9 = Garden.create(
    name: "Garden with beach views",
    description: "A garden in Barcelona with views of the Beach",
    location: "Barcelona, Spain",
    price: 110,
    user: User.all.sample
    )
  garden_9.image.attach(io: URI.open('https://source.unsplash.com/800x600/?garden'), filename: "garden_9.jpg")

puts "Created #{Garden.count} sample gardens"

puts "Creating sample bookings"

100.times do
  booking = Booking.new(
    date: Faker::Date.forward(days: 60),
    confirmed: true,
    user: User.all.sample,
    garden: Garden.all.sample,
    )
  booking.save
end

puts"Created #{Booking.count} sample bookings"

puts "Creating sample reviews"

reviews = ['Lovely Garden', 'Ideal for familys', 'Great place to relax', 'The kids loved playing in the garden', 'Very well kept']

100.times do
  review = Review.new(
    review: reviews.sample,
    rating: rand(3..5),
    booking: Booking.all.sample,
    )
  review.save
end

puts"Created #{Review.count} sample reviews"
puts "Seed complete"
