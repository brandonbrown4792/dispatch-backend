# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying data'
Note.destroy_all
Appointment.destroy_all
DispatcherPatient.destroy_all
DispatcherNurse.destroy_all
Message.destroy_all
User.destroy_all
puts 'Data destroyed'


addresses = [
  '2060 Peachtree Rd, Atlanta, GA 30309',
  '1856 Piedmont Ave NE, Atlanta, GA 30324',
  '761 Sidney Marcus Blvd NE, Atlanta, GA 30324',
  '2319 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '2239 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '2320 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '2353 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '610 Spring St NW, Atlanta, GA 30308',
  '1836 Briarcliff Rd NE, Atlanta, GA 30329',
  '2448 Cheshire Bridge Rd NE, Atlanta, GA 30324',

  '639 Morosgo Dr NE, Atlanta, GA 30324',
  '2374 Briarcliff Rd NE, Atlanta, GA 30329',
  '1181 McPherson Ave SE, Atlanta, GA 30316',
  '2195 Monroe Dr NE, Atlanta, GA 30324',
  '496 Plasters Ave NE, Atlanta, GA 30324',
  '2800 Buford Hwy NE, Atlanta, GA 30324',
  '2200 Monroe Dr NE, Atlanta, GA 30324',
  '2911 Buford Hwy NE, Atlanta, GA 30329',
  '2375 N Druid Hills Rd NE, Atlanta, GA 30329',
  '2289 N Druid Hills Rd NE, Atlanta, GA 30329',

  '2555 Piedmont Rd NE #100, Atlanta, GA 30324',
  '2625 Piedmont Rd NE suite 55, Atlanta, GA 30324',
  '541 Main St NE F170, Atlanta, GA 30324',
  '2469 Piedmont Rd NE, Atlanta, GA 30324',
  '2561 Piedmont Rd NE, Atlanta, GA 30324',
  '1879 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '3393 Peachtree Rd NE Ste 3058B, Atlanta, GA 30326',
  '2430 Piedmont Rd NE, Atlanta, GA 30324',
  '573 Main St NE, Atlanta, GA 30324',
  '2100 Cheshire Bridge Rd NE, Atlanta, GA 30324',

  '1958 Piedmont Rd NE, Atlanta, GA 30324',
  '1940 Piedmont Rd NE, Atlanta, GA 30324',
  '1842 Piedmont Ave NE, Atlanta, GA 30324',
  '1842 Piedmont Ave NE, Atlanta, GA 30324',
  '56 E Andrews Dr NW Suite 17, Atlanta, GA 30305',
  '1824 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '2184 Cheshire Bridge Rd NE, Atlanta, GA 30324',
  '2591 Piedmont Rd NE #1110, Atlanta, GA 30324',
  '2770 Lenox Rd NE, Atlanta, GA 30324',
  '2350 Cheshire Bridge Rd NE, Atlanta, GA 30324',

  '515 Garson Dr NE, Atlanta, GA 30324',
  'Lindridge Way NE, Atlanta, GA 30324',
  '764 Miami Cir NE, Atlanta, GA 30324',
  '1438 Sheridan Rd NE, Atlanta, GA 30324',
  '1408 Mayson St NE, Atlanta, GA 30324',
  '1700 Piedmont Ave NE, Atlanta, GA 30324',
  '2461 Peachtree Rd, Atlanta, GA 30305',
  '2715 Peachtree Rd, Atlanta, GA 30305',
  '2108 Briarcliff Rd NE, Atlanta, GA 30329',
  '1095 Zonolite Rd NE #100th, Atlanta, GA 30306',

  '3180 Peachtree Rd NE, Atlanta, GA 30305',
  '750 Hammond Dr # 12-310, Sandy Springs, GA 30328',
  '1580 Peachtree Rd NW, Atlanta, GA 30309',
  '1406 Sheridan Rd NE, Atlanta, GA 30324',
  '1411 N Morningside Dr NE, Atlanta, GA 30306',
  '1790 Lavista Rd, Atlanta, GA 30329',
  '1015 E Rock Springs Rd NE, Atlanta, GA 30306',
  '3336 Peachtree Rd NE, Atlanta, GA 30326',
  '1740 Peachtree Rd NW, Atlanta, GA 30309',
  '2744 Peachtree Rd NW, Atlanta, GA 30305'
]

def get_address(addresses)
  address = addresses.sample
  addresses.delete(address)
  address
end

puts 'Creating users'

# Static user data
brandon = User.create(name: 'Brandon', email: 'brandon@brandon.com', password: '123', user_type: 2, address: get_address(addresses))
robert = User.create(name: 'Robert', email: 'robert@robert.com', password: '123', user_type: 1, address: get_address(addresses))
lindsey = User.create(name: 'Lindsey', email: 'lindsey@lindsey.com', password: '123', user_type: 1, address: get_address(addresses))
geoffrey = User.create(name: 'Geoffrey', email: 'geoffrey@geoffrey.com', password: '123', user_type: 0, address: get_address(addresses))
cory = User.create(name: 'Cory', email: 'cory@cory.com', password: '123', user_type: 0, address: get_address(addresses))
joey = User.create(name: 'Joey', email: 'joey@joey.com', password: '123', user_type: 0, address: get_address(addresses))

index = 1
# Faker user data
2.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 2, address: get_address(addresses))
  puts "Created dispatcher #{index}"
  index += 1
end

index = 1
8.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 1, address: get_address(addresses))
  puts "Created nurse #{index}"
  index += 1
end

index = 1
30.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 0, address: get_address(addresses))
  puts "Created patient #{index}"
  index += 1
end

puts 'Users created'


patients = User.where(user_type: 0)
nurses = User.where(user_type: 1)
dispatchers = User.where(user_type: 2)


puts 'Creating messages'
Message.create(content: 'Hello', sender: brandon, recipient: robert)
Message.create(content: 'Hello, how are you?', sender: robert, recipient: brandon)
Message.create(content: 'Hello, how are you?', sender: robert, recipient: brandon)
Message.create(content: 'I\'m doing good', sender: brandon, recipient: robert)
Message.create(content: 'Ok bye', sender: robert, recipient: brandon)
puts 'Messages created'


reasons = ['Checkup', 'Admission', 'Just to see what up']

puts 'Creating appointments'
today = DateTime.now
patients.each do |patient|
  rand(1..5).times do
    date_time = DateTime.now + rand(1..10).days
    date_time.change(hour: rand(8..17), minute: 0)
    Appointment.create(start_time: date_time, length: rand(0..1) ? 60 : 30, patient: patient, nurse: nurses.sample, reason: reasons.sample, address: patient.address)
  end
end
puts 'Appointments created'


puts 'Creating appointment notes'
Appointment.all.each do |appointment|
  rand(0..3).times do
    content = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    Note.create(content: content, appointment: appointment)
  end
end
puts 'Appointment notes created'


puts 'Creating dispatcher / patient relationships'
patients.each do |patient|
  DispatcherPatient.create(dispatcher: dispatchers.sample, patient: patient)
end
puts 'Dispatcher / patient relationships created'


puts 'Creating dispatcher / nurse relationships'
nurses.each do |nurse|
  DispatcherNurse.create(dispatcher: dispatchers.sample, nurse: nurse)
end
puts 'Dispatcher / nurse relationships created'