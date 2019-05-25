# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroy all"
User.destroy_all
Cocktail.destroy_all

# ----------------------------------------------------------------------

puts "Create users"

def create_user(email, password)
  User.create!(email: email, password: password)
end

users = [
  create_user('validatesCocktail1@gmail.com', 'secret'),
  create_user('validatesCocktail2@gmail.com', 'secret'),
  create_user('validatesCocktail3@gmail.com', 'secret'),
  create_user('validatesCocktail4@gmail.com', 'secret')
]

# ----------------------------------------------------------------------

puts "Create cocktails"

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)["drinks"]

cocktails.each do |cocktail|
  Cocktail.create!(name: cocktail["strDrink"], remote_photo_url: cocktail["strDrinkThumb"], user_id: users.sample[:id])
end
