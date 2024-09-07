# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   
#

require 'open-uri'

if Rails.env.development?
  admin = AdminUser.find_or_initialize_by(email: 'admin@example.com') 
  admin.update(password: 'password', password_confirmation: 'password')
end

products = [
  { name: 'Product 1', price: 100 },
  { name: 'Product 2', price: 200 },
  { name: 'Product 3', price: 300 },
  { name: 'Product 4', price: 400 },
  { name: 'Product 5', price: 500 }
]

Product.upsert_all(products, unique_by: :name)

product_set = Product.where(name: products.pluck(:name))

product_set.each_with_index do |product,index|
  product.image.attach(
    io: File.open(Rails.root.join("db/images/product_#{index+1}.jpg")),
    filename: "product_#{index+1}",
    content_type: 'image/jpg',
    identify: false
  )
end