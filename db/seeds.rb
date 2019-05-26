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
Ingredient.destroy_all
Dose.destroy_all

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

puts "Create ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)["drinks"]

ingredient.each do |ing|
  Ingredient.create!(name: ing["strIngredient1"])
end

# ----------------------------------------------------------------------

puts "Create cocktails"

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)["drinks"]

cocktails.each do |cocktail|

  id = cocktail["idDrink"]
  url_cocktail = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"
  cocktail_id_serialized = open(url_cocktail).read
  cocktail_id = JSON.parse(cocktail_id_serialized)["drinks"][0]

  new_cocktail = Cocktail.create!(name: cocktail_id["strDrink"],description: cocktail_id["strInstructions"], remote_photo_url: cocktail_id["strDrinkThumb"], user_id: users.sample[:id])

  puts "Create doses"

  Dose.create!(quantity: cocktail_id["strMeasure1"],
    ingredient_id: Ingredient.where(name: cocktail_id["strIngredient1"])[0].id,
    cocktail_id: new_cocktail[:id]) if Ingredient.where(name: cocktail_id["strIngredient1"])[0] != nil

  Dose.create!(quantity: cocktail_id["strMeasure2"],
    ingredient_id: Ingredient.where(name: cocktail_id["strIngredient2"])[0].id,
    cocktail_id: new_cocktail[:id]) if Ingredient.where(name: cocktail_id["strIngredient2"])[0] != nil

  Dose.create!(quantity: cocktail_id["strMeasure3"],
    ingredient_id: Ingredient.where(name: cocktail_id["strIngredient3"])[0].id,
    cocktail_id: new_cocktail[:id]) if Ingredient.where(name: cocktail_id["strIngredient3"])[0] != nil

  Dose.create!(quantity: cocktail_id["strMeasure4"],
    ingredient_id: Ingredient.where(name: cocktail_id["strIngredient4"])[0].id,
    cocktail_id: new_cocktail[:id]) if Ingredient.where(name: cocktail_id["strIngredient4"])[0] != nil
end

# ----------------------------------------------------------------------

