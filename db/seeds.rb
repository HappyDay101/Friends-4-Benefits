# db/seeds.rb
# Ensure Faker is loaded
require 'faker'
require "open-uri"
require 'json'
require 'uri'
require 'net/http'

# Clear previous records
puts 'Destroying all previous records'
User.destroy_all
Service.destroy_all
Booking.destroy_all


# Seed Users
puts 'Creating 20 new users...'
20.times do
  url = URI("https://randomuser.me/api/")
  response = Net::HTTP.get(url)
  json = JSON.parse(response)
  results = json["results"]
  results.each do |result|
    user = User.create!(
      first_name: result["name"]["first"],
      last_name: result["name"]["last"],
      email: result["email"],
      password: 'password'
    )
    img_url = result["picture"]["large"]
    file = URI.open(img_url)
    user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')
    puts "User #{user.first_name} has been created..."
  end
end
puts "All users are done!"

# Seed Services
puts 'Creating 18 new services'

japanese_cities = ['Tokyo', 'Osaka', 'Kyoto', 'Sapporo', 'Fukuoka', 'Nagoya', 'Yokohama', 'Kobe', 'Hiroshima', 'Sendai']

services = {
  'Animal Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/cfffnmhhpwftngtbbwew.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/ukrbksjn3zateydlmkj0.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/ave88pekucon1kwgvidy.jpg] },
  'Coding Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/j3dtijj2h4wzymcpqeny.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/lnzogvsv8ttf0dbf8i1e.webp https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/m3myz7n3ci7ftvg7nmkd.jpg] },
  'Cult Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/lqasclmp6eulq7dfm7yg.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/f7gznt4rtgqn9golwipn.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/aemjsejdx4nzek373biz.jpg] },
  'Drink Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/jfyazvtm2ducpcxrkurh.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/hz8i1kqxa5skwbbmfi0o.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/ntyuxt4llvfhbk4bozgi.jpg] },
  'Emo Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/ziavdexwiwucfsdijvbz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/r1fxnnd2opiks5jqnggd.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/admp1mkkxa9capqmb8za.jpg] },
  'Sports Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/xf54fbliighf8zmsgqkq.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/jhy2a9vjz7uukldjvzat.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/r5mlzz77tjxiaupgap7n.jpg] },
}

services.each do |name, info|
  3.times do
    service = Service.create!(
      user: User.all.sample,
      service_name: name,
      description: Faker::Lorem.paragraph,
      category: name,
      price: [3000, 3500, 4000, 4500, 5000].sample,
      location: japanese_cities.sample
    )
    info[:image_urls].each do |image_url|
      puts "Opening... #{image_url}"
      file = URI.open(image_url)
      service.photos.attach(io: file, filename: 'service.jpg', content_type: 'image/jpg')
    end
    puts "#{service.service_name} service with #{service.user.first_name}has been created"
  end
end
puts 'All services are done!'

# # Seed Bookings
puts 'Creating 8 new bookings'
8.times do
  booking = Booking.create!(
    user: User.all.sample,
    service: Service.all.sample,
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 3),
    end_date: Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 6),
    comment: Faker::Lorem.paragraph_by_chars,
    status: Booking.statuses.keys.sample
  )
  puts "#{booking.service.service_name} booking has been created"
end
puts 'All bookings are done!'
