require 'faker'

10.times do

  Category.create!(
    name:  Faker::Food.vegetables
  )
end
categories = Category.all

50.times do
  Recipe.create!(
    category: categories.sample,
    title: Faker::Food.dish,
    ingredient: Faker::Food.ingredient,
    body: Faker::Food.description
  )
end
recipes = Recipe.all

puts "Seed finished"
puts "#{Category.count} categories created"
puts "#{Recipe.count} recipes created"
