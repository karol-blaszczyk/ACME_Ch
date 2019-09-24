# frozen_string_literal: true

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
