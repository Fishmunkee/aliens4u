# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seeding user'
@user = User.new
@user.email = "test1@test.com"
@user.password = "fohdsobnfdaivn"
@user.save!

puts 'Seeding aliens'

Alien.create(name: 'Jar Jar Binks', species: 'Gungan', planet: 'Naboo', user: @user)
puts 'Finished seeding'
