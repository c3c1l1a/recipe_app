# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Inventory.destroy_all
Recipe.destroy_all
Food.destroy_all

# User seeder
user = User.create!(name: 'Rito', email:'abcd@gmail.com', password: '123456')

# Inventory Seeder
inventory = Inventory.create!(name: 'Inventory 1', user: user)

#Recipe seed
recipe1= Recipe.create!(name:'Jollof Rice',preparation_time:5,cooking_time:30,description:'This is a very delicious jollof rice',public:true,user:user)
recipe2= Recipe.create!(name:'Fried Rice',preparation_time:5,cooking_time:30,description:'This is a very delicious fried rice',public:true,user:user)

# Food Seeder
food1 = Food.create!(name: 'Rice', measurement_unit: '30 kg', price: 10)
food2 = Food.create!(name: 'Salad', measurement_unit: '10 kg', price: 50)
