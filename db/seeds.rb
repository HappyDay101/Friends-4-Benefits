# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# db/seeds.rb

# Ensure Faker is loaded
require 'faker'

# Clear previous records
User.destroy_all
Service.destroy_all
Booking.destroy_all

# Seed Users
5.times do
  User.create(
    email: Faker::Internet.email,
    password: 'password' # You might want to set a default password
  )
end

# Seed Services
japanese_cities = ['Tokyo', 'Osaka', 'Kyoto', 'Sapporo', 'Fukuoka', 'Nagoya', 'Yokohama', 'Kobe', 'Hiroshima', 'Sendai']

10.times do
  Service.create(
    user: User.all.sample,
    service_name: "#{['Date', 'Friend', 'Food Buddy', 'Adventure Companion'].sample}: #{Faker::Lorem.words(number: 2).join(' ')}",
    description: Faker::Lorem.paragraph,
    category: ['Date', 'Friend', 'Food Buddy', 'Adventure Companion'].sample,
    price: Faker::Commerce.price,
    location: japanese_cities.sample
  )
end

# Seed Bookings
15.times do
  Booking.create(
    user: User.all.sample,
    service: Service.all.sample
  )
end
