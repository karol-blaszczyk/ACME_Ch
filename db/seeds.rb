# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[{
  name: 'Bronze Box',
  price: 1999
},
 {
   name: 'Silver Box',
   price: 4900

 },
 {
   name: 'Gold Box',
   price: 9900

 }].each { |plan| Plan.create(plan) }
