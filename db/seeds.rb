# db/seeds.rb
# Ensure Faker is loaded
require 'faker'

# Clear previous records
puts 'Destroying all previous records'
User.destroy_all
Service.destroy_all
Booking.destroy_all

# Seed Users
puts 'Creating 5 new users'
5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'password'
  )
  puts "#{user.email} has been created"
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

Seed Bookings
puts 'Creating 15 new bookings'
15.times do
  booking = Booking.create!(
    user: User.all.sample,
    service: Service.all.sample,
    start_date: Faker::Date.forward(from: Date.current, days: 14),
    end_date: Faker::Date.forward(from: Date.current, days: (15...60)),
    comment: Faker::Lorem.paragraph_by_chars,
    status: false
  )
  puts "#{booking.name} has been created"
end

puts 'Bookings are done!'
