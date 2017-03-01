# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'asdf'
user['encrypted_password'] = 'asdf'

ActiveRecord::Base.transaction do
  50.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do
    listing['home_title'] = Faker::Superhero.name
    listing['home_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['room_type'] = ['Entire place','Shared room','Private room'].sample
    listing['bedroom'] = rand(1..5)
    listing['bathroom'] = rand(1..3)
    listing['accomodate'] = rand(1..8)
    listing['address'] = Faker::LordOfTheRings.location
    listing['states'] = Faker::StarWars.planet
    listing['price'] = rand(100..1000)
    listing['summary'] = Faker::Hipster.paragraph
    listing['got_tv'] = Faker::Boolean.boolean
    listing['got_kitchen'] = Faker::Boolean.boolean
    listing['got_aircond'] = Faker::Boolean.boolean
    listing['got_internet'] = Faker::Boolean.boolean
    listing['got_gym'] = Faker::Boolean.boolean
    listing['got_pool'] = Faker::Avatar.image

    Listing.create(listing)
  end
end
