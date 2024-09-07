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
  { name: 'Product 1', price: 100},
  { name: 'Product 2', price: 200 },
  { name: 'Product 3', price: 300 },
  { name: 'Product 4', price: 400 },
  { name: 'Product 5', price: 500 },
  { name: 'Product 6', price: 600 },
  { name: 'Product 7', price: 700 },
  { name: 'Product 8', price: 800 },
  { name: 'Product 9', price: 900 },
  { name: 'Product 10', price: 1000 }
]

Product.upsert_all(products, unique_by: :name)

product_set = Product.where(name: products.pluck(:name))

product_set.each_with_index do |product,index|
  product.image.attach(
    io: File.open(Rails.root.join("db/images/product_0#{index+1}.jpg")),
    filename: "product_0#{index+1}",
    content_type: 'image/jpg',
    identify: false
  )
end

3.times do |n|
  order = Order.new
  total = 0.0
  product_count = product_set.count
  random_number = rand(1...product_count)

  product_set.last(random_number).each do |product|
    order.order_items.new(product_id: product.id, quantity: random_number, sub_total: product.price*3)
    total += product.price*random_number.to_f
  end
  
  order.total = total
  order.save!
end