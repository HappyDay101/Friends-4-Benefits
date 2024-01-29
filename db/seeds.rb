# db/seeds.rb
# Ensure Faker is loaded
require 'faker'
require "open-uri"

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

puts 'Creating 12 new services'

# Date Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/date_brbgho.jpg")

date_service = Service.new(
  user: User.all.sample,
  service_name: "Date",
  description: Faker::Lorem.paragraph,
  category: "date",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
date_service.photo.attach(io: file, filename: "date.jpg", content_type: "image/jpg")
date_service.save

puts "#{date_service.service_name} has been created"

# Friend Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/friend_qdemyk.jpg")

friend_service = Service.new(
  user: User.all.sample,
  service_name: "Friend",
  description: Faker::Lorem.paragraph,
  category: "friend",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
friend_service.photo.attach(io: file, filename: "friend.jpg", content_type: "image/jpg")
friend_service.save

puts "#{friend_service.service_name} has been created"

# Food Buddy Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/food_buddy_t3vqdw.jpg")

food_buddy_service = Service.new(
  user: User.all.sample,
  service_name: "Food Buddy",
  description: Faker::Lorem.paragraph,
  category: "food_buddy",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
food_buddy_service.photo.attach(io: file, filename: "food_buddy.jpg", content_type: "image/jpg")
food_buddy_service.save

puts "#{food_buddy_service.service_name} has been created"

# Adventure Companion Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/adventure_uspiph.jpg")

adventure_companion_service = Service.new(
  user: User.all.sample,
  service_name: "Adventure Companion",
  description: Faker::Lorem.paragraph,
  category: "adventure_companion",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
adventure_companion_service.photo.attach(io: file, filename: "adventure_companion.jpg", content_type: "image/jpg")
adventure_companion_service.save

puts "#{adventure_companion_service.service_name} has been created"

# Code Helper Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/code_p6esrj.jpg")

code_helper_service = Service.new(
  user: User.all.sample,
  service_name: "Code Helper",
  description: Faker::Lorem.paragraph,
  category: "code_helper",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
code_helper_service.photo.attach(io: file, filename: "code_helper.jpg", content_type: "image/jpg")
code_helper_service.save

puts "#{code_helper_service.service_name} has been created"

# Fake Marriage Partner Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329817/Friends%204%20Benefits/marriage_hfvcum.jpg")

fake_marriage_service = Service.new(
  user: User.all.sample,
  service_name: "Fake Marriage",
  description: Faker::Lorem.paragraph,
  category: "fake_marriage",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
fake_marriage_service.photo.attach(io: file, filename: "fake_marriage.jpg", content_type: "image/jpg")
fake_marriage_service.save

puts "#{fake_marriage_service.service_name} has been created"

# Cult Follower Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/cult_ie3hao.jpg")

cult_follower_service = Service.new(
  user: User.all.sample,
  service_name: "Cult Follower",
  description: Faker::Lorem.paragraph,
  category: "cult_follower",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
cult_follower_service.photo.attach(io: file, filename: "cult_follower.jpg", content_type: "image/jpg")
cult_follower_service.save

puts "#{cult_follower_service.service_name} has been created"

# Emo Buddies Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/emo_omwyd0.jpg")

emo_buddy_service = Service.new(
  user: User.all.sample,
  service_name: "Emo Buddy",
  description: Faker::Lorem.paragraph,
  category: "emo_buddy",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
emo_buddy_service.photo.attach(io: file, filename: "emo_buddy.jpg", content_type: "image/jpg")
emo_buddy_service.save

puts "#{emo_buddy_service.service_name} has been created"

# Sport Buddy Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329817/Friends%204%20Benefits/sports_gdv0fq.jpg")

sport_buddy_service = Service.new(
  user: User.all.sample,
  service_name: "Sport Buddy",
  description: Faker::Lorem.paragraph,
  category: "sport_buddy",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
sport_buddy_service.photo.attach(io: file, filename: "sport_buddy.jpg", content_type: "image/jpg")
sport_buddy_service.save

puts "#{sport_buddy_service.service_name} has been created"

# Road Trip Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/road_ccxmfw.jpg")

road_trip_service = Service.new(
  user: User.all.sample,
  service_name: "Road Trip",
  description: Faker::Lorem.paragraph,
  category: "road_trip",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
road_trip_service.photo.attach(io: file, filename: "road_trip.jpg", content_type: "image/jpg")
road_trip_service.save

puts "#{road_trip_service.service_name} has been created"

# Drinking Buddy Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/drinks_vcojy7.jpg")

drinking_buddy_service = Service.new(
  user: User.all.sample,
  service_name: "Drinking Buddy",
  description: Faker::Lorem.paragraph,
  category: "drinking_buddy",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
drinking_buddy_service.photo.attach(io: file, filename: "drinking_buddy.jpg", content_type: "image/jpg")
drinking_buddy_service.save

puts "#{drinking_buddy_service.service_name} has been created"

# Animal Lover Seed

file = URI.open("https://res.cloudinary.com/du0bsrgmp/image/upload/v1706483690/Friends%204%20Benefits/animal_gjia1q.jpg")

animal_lover_service = Service.new(
  user: User.all.sample,
  service_name: "Animal Lover",
  description: Faker::Lorem.paragraph,
  category: "animal_lover",
  price: Faker::Commerce.price,
  location: japanese_cities.sample
)
animal_lover_service.photo.attach(io: file, filename: "animal_lover.jpg", content_type: "image/jpg")
animal_lover_service.save

puts "#{animal_lover_service.service_name} has been created"

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
