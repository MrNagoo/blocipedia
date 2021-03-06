# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password"
    )
end
users = User.all
50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body:Faker::Lorem.paragraph,
    user: users.sample
    )
end
