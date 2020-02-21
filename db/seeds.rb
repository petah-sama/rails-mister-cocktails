# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Reading ingredients from remote json"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
json = JSON.parse(response.body, symbolize_names: true)


puts "Throwing ingredients in the trash 🚮"
Ingredient.destroy_all

puts "Buying more ingredients 🏬"
json[:drinks].each do |drink|
  name = drink[:strIngredient1]
  Ingredient.create!(name: name)
end

puts 'Ingredients ready for cocktails! 🍹'

puts 'Throwing away all cocktails 🚮'
Cocktail.destroy_all

puts "Creating some new cocktails 🍸"
20.times do
  first = Faker::TvShows::HowIMetYourMother.catch_phrase
  second = Faker::Dessert.unique.flavor

  Cocktail.create!(name: "#{first} #{second}")
end

puts 'Done! 🍹'
