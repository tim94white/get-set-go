require "open-uri"

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

furnishing_attributes = [
  { title: "Mid-Century Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "Parker Knoll Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Persian Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Rattan Chair", description: "1960s Rattan Bamboo Chair", price: 120, location: "London", furnishing_type: "Chair"},
  { title: "Slim Aarons Print", description: "Print with white frame", price: 220, location: "London", furnishing_type: "Wall Art"}]

furnishing_attributes.each do |furnishing_attribute|
  user_attribute = {user_id: user.id}
  furnishing = Furnishing.new(furnishing_attribute.merge(user_attribute))

  file = URI.open("https://source.unsplash.com/featured/?furniture")
  furnishing.photo.attach(io: file, filename: "chairs", content_type: file.content_type_parse.first)
  furnishing.save!
end

puts "Created 6 furnishings"

user2 = User.create!(email: "timmy@gmail.com", password: "123456")

puts "Created a user with email: timmy@gmail.com and password: 123456"

