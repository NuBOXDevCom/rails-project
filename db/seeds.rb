# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Generate StanHome Fake Products
require 'faker'
Faker::Config.locale = 'fr'

#15.times do
#  StanhomeProduct.create(reference: Faker::Number.number(6), product_name: Faker::Commerce.product_name, quantity: Faker::Number.between(1, 50))
#end

#Task.create! name: "Meet Mr. Miyagi", complete: true
#Task.create! name: "Paint the fence", complete: true
#Task.create! name: "Wax the car"
#Task.create! name: "Sand the deck"

Category.create! name: "Apéritif"
Category.create! name: "Entrée"
Category.create! name: "Plat de Résistance"
Category.create! name: "Dessert"
Category.create! name: "Autre"