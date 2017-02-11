# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
Ingredient.destroy_all
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ing|
  Ingredient.create(name: ing["strIngredient1"].to_s)
end


urlb = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"

Cocktail.destroy_all
cocktails = JSON.parse(open(urlb).read)

cocktails["drinks"].each do |ing|
  cocktail = Cocktail.create(name: ing["strDrink"], remote_photo_url: ing["strDrinkThumb"])
end

