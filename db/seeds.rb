# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @user = User.find(1)
# if @user.nil?
#   @user = User.new
#   @user.email = "test1@test.com"
#   @user.password = "fohdsobnfdaivn"
#   @user.save!
# end



# Alien.create(name: 'Jar Jar Binks', species: 'Gungan', planet: 'Naboo', user: @user)
# puts 'Finished seeding'
3.times do
  puts "Creating users"
  user = User.create(
    email: Faker::Internet.email,
    password: "password"
    )

    10.times do alien = Alien.create(
      name: Faker::JapaneseMedia::DragonBall.character,
      species: Faker::JapaneseMedia::DragonBall.race,
      planet: Faker::JapaneseMedia::DragonBall.planet,
      user: user
      )
  end
end


