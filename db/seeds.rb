# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Furnishing.destroy_all
User.destroy_all

user = User.create!(email: "heba@gmail.com", password: "123456")

puts "Created a user with email: heba@gmail.com and password: 123456"

furnishing_attributes = [{ title: "Mid-Century Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" }, { title: "Parker Knoll Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Furniture"}, { title: "Persian Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Accessory"}]
furnishing_attributes.each do |furnishing|
  user_attribute = {user_id: user.id}
  Furnishing.create!(furnishing.merge(user_attribute))
end

puts "Created 3 furnishings"


