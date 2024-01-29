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
puts 'Creating 108 new users'
108.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
  )
  puts "#{user.first_name} has been created"
end
puts "All users are done!"

# Seed Services
puts 'Creating 12 new services'

japanese_cities = ['Tokyo', 'Osaka', 'Kyoto', 'Sapporo', 'Fukuoka', 'Nagoya', 'Yokohama', 'Kobe', 'Hiroshima', 'Sendai']

services = {
  'Adventure Buddy' => { image_urls: %w[adventures/adventure_1.jpg adventures/adventure_2.jpg adventures/adventure_3.jpg adventures/adventure_4.jpg adventures/adventure_5.jpg adventures/adventure_6.jpg adventures/adventure_7.jpg] },
  'Animal Buddy' => { image_urls: %w[animals/animal_1.jpg animals/animal_2.jpg animals/animal_3.jpg animals/animal_4.jpg animals/animal_5.jpg animals/animal_6.jpg animals/animal_7.jpg] },
  'Coding Buddy' => { image_urls: %w[codes/code_1.jpg codes/code_2.jpg codes/code_3.jpg codes/code_4.jpg codes/code_5.jpg codes/code_6.jpg codes/code_7.jpg] },
  'Cult Buddy' => { image_urls: %w[cults/cult_1.jpg cults/cult_2.jpg cults/cult_3.jpg cults/cult_4.jpg cults/cult_5.jpg cults/cult_6.jpg cults/cult_7.jpg] },
  'Date Buddy' => { image_urls: %w[dates/date_1.jpg dates/date_2.jpg dates/date_3.jpg dates/date_4.jpg dates/date_5.jpg dates/date_6.jpg dates/date_7.jpg] },
  'Drink Buddy' => { image_urls: %w[drinks/drink_1.jpg drinks/drink_2.jpg drinks/drink_3.jpg drinks/drink_4.jpg drinks/drink_5.jpg drinks/drink_6.jpg drinks/drink_7.jpg ] },
  'Emo Buddy' => { image_urls: %w[emos/emo_1.jpg emos/emo_2.jpg emos/emo_3.jpg emos/emo_4.jpg emos/emo_5.jpg emos/emo_6.jpg emos/emo_7.jpg ] },
  'Food Buddy' => { image_urls: %w[foods/food_1.jpg foods/food_2.jpg foods/food_3.jpg foods/food_4.jpg foods/food_5.jpg foods/food_6.jpg foods/food_7.jpg ] },
  'Buddy Buddy' => { image_urls: %w[friends/friend_1.jpg friends/friend_2.jpg friends/friend_3.jpg friends/friend_4.jpg friends/friend_5.jpg friends/friend_6.jpg friends/friend_7.jpg ] },
  'Marriage Buddy' => { image_urls: %w[marriages/marriage_1.jpg marriages/marriage_2.jpg marriages/marriage_3.jpg marriages/marriage_4.jpg marriages/marriage_5.jpg marriages/marriage_6.jpg marriages/marriage_7.jpg ] },
  'Road Buddy' => { image_urls: %w[roads/road_1.jpg roads/road_2.jpg roads/road_3.jpg roads/road_4.jpg roads/road_5.jpg roads/road_6.jpg roads/road_7.jpg ] },
  'Sports Buddy' => { image_urls: %w[sports/sport_1.jpg sports/sport_2.jpg sports/sport_3.jpg sports/sport_4.jpg sports/sport_5.jpg sports/sport_6.jpg sports/sport_7.jpg ] },

}

services.each do |name, info|
  service = Service.create!(
    user: User.all.sample,
    service_name: name,
    description: Faker::Lorem.paragraph,
    category: name,
    price: Faker::Commerce.price(range: 3000..10_000),
    location: japanese_cities.sample
  )
  info[:image_urls].each do |image_url|
    puts "Opening... #{image_url}"
    file = File.open(File.join(Rails.root, "app/assets/images/#{image_url}"))
    # file = URI.open(image_url)
    service.photos.attach(io: file, filename: 'service.jpg', content_type: 'image/jpg')
  end
  puts "Service #{service.service_name} has been created!"
end

puts 'All services are done!'

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

puts 'All bookings are done!'
