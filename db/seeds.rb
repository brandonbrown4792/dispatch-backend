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


puts 'Creating users'

# Static user data
brandon = User.create(name: 'Brandon', email: 'brandon@brandon.com', password: '123', user_type: 2)
robert = User.create(name: 'Robert', email: 'robert@robert.com', password: '123', user_type: 1)
lindsey = User.create(name: 'Lindsey', email: 'lindsey@lindsey.com', password: '123', user_type: 1)
geoffrey = User.create(name: 'Geoffrey', email: 'geoffrey@geoffrey.com', password: '123', user_type: 0)
cory = User.create(name: 'Cory', email: 'cory@cory.com', password: '123', user_type: 0)
joey = User.create(name: 'Joey', email: 'joey@joey.com', password: '123', user_type: 0)

# Faker user data
3.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 2)
end

15.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 1)
end

60.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123', user_type: 0)
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


puts 'Creating appointments'
today = DateTime.now
patients.each do |patient|
  rand(1..5).times do
    date_time = DateTime.now + rand(1..10).days
    date_time.change(hour: rand(8..17), minute: 0)
    Appointment.create(start_time: date_time, length: rand(0..1) ? 60 : 30, patient: patient, nurse: nurses.sample)
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