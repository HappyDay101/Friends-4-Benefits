# db/seeds.rb
# Ensure Faker is loaded
require 'faker'

# Clear previous records
User.destroy_all
Service.destroy_all
Booking.destroy_all

# Seed Users
5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'password'
  )

  # Seed Services for each User
  2.times do
    service = Service.create(
      user: user,
      service_name: "#{['Date', 'Friend', 'Food Buddy', 'Adventure Companion'].sample}: #{Faker::Lorem.words(number: 2).join(' ')}",
      description: Faker::Lorem.paragraph,
      category: ['Date', 'Friend', 'Food Buddy', 'Adventure Companion'].sample,
      price: Faker::Commerce.price,
      location: Faker::Address.city
    )

    # Clear bookings associated with the service
    service.bookings.destroy_all
  end
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
