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
  'Adventure Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/adventure_uspiph.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512006/Friends%204%20Benefits/adventures/d0l2v2j60ihkofjpdszb.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512006/Friends%204%20Benefits/adventures/r98onrftgfujf4ytdwdv.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512005/Friends%204%20Benefits/adventures/zmbsknye72jopmhokasp.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512005/Friends%204%20Benefits/adventures/itxzb06tmrjvuehegvpf.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512005/Friends%204%20Benefits/adventures/tkcx4confoeompjjq50l.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512005/Friends%204%20Benefits/adventures/ro0lkxyjmtsexntuz0bj.jpg] },
  'Animal Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706483690/Friends%204%20Benefits/animal_gjia1q.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/cfffnmhhpwftngtbbwew.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/ukrbksjn3zateydlmkj0.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/ave88pekucon1kwgvidy.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/lt9vvxr3c7v8uokldwk1.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/tsqf0xysmmqyqkjgrem0.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512121/Friends%204%20Benefits/animals/u7haivzfljns6iyb5irh.jpg] },
  'Coding Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/code_p6esrj.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/j3dtijj2h4wzymcpqeny.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/lnzogvsv8ttf0dbf8i1e.webp https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512143/Friends%204%20Benefits/codes/m3myz7n3ci7ftvg7nmkd.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512142/Friends%204%20Benefits/codes/yrkn0pvddetppy0icao6.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512142/Friends%204%20Benefits/codes/q5fyhyuyckju7lfhueui.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512142/Friends%204%20Benefits/codes/wmxvdgdkfvjxspygr5qx.jpg] },
  'Cult Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/cult_ie3hao.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/lqasclmp6eulq7dfm7yg.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/f7gznt4rtgqn9golwipn.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/aemjsejdx4nzek373biz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/victskmrlpxwtd3lcxuw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512160/Friends%204%20Benefits/cults/ltgwvevu4lqtvhmmqvjd.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512159/Friends%204%20Benefits/cults/e4x3a11giq7vucbmadtk.jpg] },
  'Date Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/date_brbgho.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491206/Friends%204%20Benefits/dates/pokcr77qwbecrz0b3yy9.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491206/Friends%204%20Benefits/dates/sxjlp0emjhrov2huyhiw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491206/Friends%204%20Benefits/dates/ytpiv9bhnrqyhnptpqfd.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491206/Friends%204%20Benefits/dates/gt2boqkv0ss8tdbtobml.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491206/Friends%204%20Benefits/dates/ba2gwtuy54j3yypsh0va.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706491205/Friends%204%20Benefits/dates/drobeuq05egu3c1iqwf7.jpg] },
  'Drink Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329815/Friends%204%20Benefits/drinks_vcojy7.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/jfyazvtm2ducpcxrkurh.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/hz8i1kqxa5skwbbmfi0o.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/ntyuxt4llvfhbk4bozgi.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512176/Friends%204%20Benefits/drinks/qdqjgr2lotgt0kse5nvz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512175/Friends%204%20Benefits/drinks/o9ego4gg55k1lkxpxbtu.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512175/Friends%204%20Benefits/drinks/v7dhds2joktrv5pyegry.jpg] },
  'Emo Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/emo_omwyd0.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/ziavdexwiwucfsdijvbz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/r1fxnnd2opiks5jqnggd.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512197/Friends%204%20Benefits/emos/admp1mkkxa9capqmb8za.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512196/Friends%204%20Benefits/emos/gn6q6ro79whjkbbzco2w.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512196/Friends%204%20Benefits/emos/p6ifwqihsskvxxx2jqhh.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512196/Friends%204%20Benefits/emos/vw1ygvfddwsctnxo9p5a.jpg] },
  'Food Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706513227/Friends%204%20Benefits/hrtnggxrwvjmhptvahii.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512213/Friends%204%20Benefits/foods/apjezauvf1bxeftqiwra.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512213/Friends%204%20Benefits/foods/gmxsmoytuxhdyenejpok.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512213/Friends%204%20Benefits/foods/ztap3hfi3t8pz3zqodqx.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512212/Friends%204%20Benefits/foods/gzhk44ifkpkwtfsilnrz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512212/Friends%204%20Benefits/foods/oze1xu1krhu1o2xr5elt.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512212/Friends%204%20Benefits/foods/dqwomc7lokeu5j1gldme.jpg] },
  'Buddy Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/friend_qdemyk.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512230/Friends%204%20Benefits/friends/yboybgckqomfefzwzisv.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512230/Friends%204%20Benefits/friends/chmsu7kb1ojdevegndgw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512230/Friends%204%20Benefits/friends/iprrjvf1mmcuczwke3xv.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512230/Friends%204%20Benefits/friends/vxqdahjjqjeucjld6inw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512229/Friends%204%20Benefits/friends/drv0xd0n3rt1o1suycsg.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512229/Friends%204%20Benefits/friends/g0gjdqg5h7iljbf2ywtb.jpg] },
  'Marriage Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329817/Friends%204%20Benefits/marriage_hfvcum.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512246/Friends%204%20Benefits/marriages/tiaz1dw1lthkmk48htu5.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512246/Friends%204%20Benefits/marriages/vrpadh9hf7bkreecl5iz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512246/Friends%204%20Benefits/marriages/xeivyffxgqmrcrsfvagz.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512246/Friends%204%20Benefits/marriages/q0yodojnu0loeqew2wds.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512246/Friends%204%20Benefits/marriages/cjffaqzwv30fnr02hvtq.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512245/Friends%204%20Benefits/marriages/g7oaqpzsbzgrvhph3g33.jpg] },
  'Road Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329816/Friends%204%20Benefits/road_ccxmfw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512264/Friends%204%20Benefits/roads/c4e3empwejfdeoktbtif.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512264/Friends%204%20Benefits/roads/syhoiig4fibkokdc1fbw.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512264/Friends%204%20Benefits/roads/yziwp2ghawqfhlxgct4e.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512264/Friends%204%20Benefits/roads/iuzne8ppws0dq3f1ugoi.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512263/Friends%204%20Benefits/roads/fo63oysvczxzlbtelbal.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512263/Friends%204%20Benefits/roads/vgzuvmdxwsfhtzpcgmkq.jpg] },
  'Sports Buddy' => { image_urls: %w[https://res.cloudinary.com/du0bsrgmp/image/upload/v1706329817/Friends%204%20Benefits/sports_gdv0fq.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/xf54fbliighf8zmsgqkq.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/jhy2a9vjz7uukldjvzat.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512279/Friends%204%20Benefits/sports/r5mlzz77tjxiaupgap7n.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512278/Friends%204%20Benefits/sports/cq1maokzmtvqklxsssvj.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512278/Friends%204%20Benefits/sports/edmychutjutjfecu5sqo.jpg https://res.cloudinary.com/du0bsrgmp/image/upload/v1706512278/Friends%204%20Benefits/sports/jvdb2tg2xmt5pyeomzi1.jpg] },

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
    file = URI.open(image_url)
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
