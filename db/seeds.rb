# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying data'
User.destroy_all
Messages.destroy_all
puts 'Data destroyed'

puts 'Creating users'
brandon = User.create(name: 'Brandon', email: 'brandon@brandon.com', password: '123', auth_level: 9999)
robert = User.create(name: 'Robert', email: 'robert@robert.com', password: '123', auth_level: 9999)
geoffrey = User.create(name: 'Geoffrey', email: 'geoffrey@geoffrey.com', password: '123', auth_level: 9999)
cory = User.create(name: 'Cory', email: 'cory@cory.com', password: '123', auth_level: 9999)
joey = User.create(name: 'Joey', email: 'joey@joey.com', password: '123', auth_level: 9999)
puts 'Users created'

puts 'Creating messages'
Message.create(content: 'Hello', sender: brandon, recipient: robert)
Message.create(content: 'Hello, how are you?', sender: robert, recipient: brandon)
Message.create(content: `I'm doing good`, sender: brandon, recipient: robert)
Message.create(content: 'Ok bye', sender: robert, recipient: brandon)
puts 'Messages created'