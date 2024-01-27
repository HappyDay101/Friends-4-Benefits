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
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
  )
  puts "#{user.first_name} has been created"
end
puts "Users are done!"

# Seed Services
japanese_cities = ['Tokyo', 'Osaka', 'Kyoto', 'Sapporo', 'Fukuoka', 'Nagoya', 'Yokohama', 'Kobe', 'Hiroshima', 'Sendai']
puts 'Creating 10 new services'
10.times do
  service = Service.create!(
    user: User.all.sample,
    service_name: "#{['Date', 'Friend', 'Food Buddy', 'Adventure Companion', 'Code Helper', 'Fake Fiance', 'Fake Groom', 'Cult Follower', 'Emo Buddies', 'Sport Activity', 'Road Trip'].sample}",
    description: Faker::Lorem.paragraph,
    category: ['Date', 'Friend', 'Food Buddy', 'Adventure Companion'].sample,
    price: Faker::Commerce.price,
    location: japanese_cities.sample
  )
  puts "#{service.service_name} has been created"
end
puts 'Services are done!'

# Seed Bookings
puts 'Creating 15 new bookings'
15.times do
  booking = Booking.create!(
    user: User.all.sample,
    service: Service.all.sample,
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 3),
    end_date: Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 6),
    comment: Faker::Lorem.paragraph_by_chars,
    status: ["Booked", "Pending", "Declined"].sample
  )
  puts "#{booking.start_date} has been created"
end

puts 'Bookings are done!'
