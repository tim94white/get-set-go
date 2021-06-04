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
  { title: "Slim Aarons Print", description: "Print with white frame", price: 220, location: "London", furnishing_type: "Wall Art"},
  { title: "Mid-Century Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "Yellow Sofa", description: "Vintage Yellow 3-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Afghani Rug", description: "Vintage handmade, blue rug", price: 200, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Dining Chair", description: "1970 Oak Chair", price: 50, location: "Italy", furnishing_type: "Chair"},
  { title: "Abstract Painting", description: "Painting with black frame", price: 140, location: "Manchester", furnishing_type: "Wall Art"},
  { title: "Brass Floor Lamp", description: "Antique Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "Vintage Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Morrocan Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Pendant Light", description: "Brass Ceilign Light", price: 60, location: "London", furnishing_type: "Lamp"},
  { title: "Retro Wall Art", description: "Print with black frame", price: 180, location: "Rome", furnishing_type: "Wall Art"},
  { title: "Chrome Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "Velvet Chaise Longue", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Berber Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Chrome Kitchen Stool", description: "1960s Rattan Bamboo Chair", price: 120, location: "London", furnishing_type: "Chair"},
  { title: "Henri Matisse Print", description: "Print with white frame", price: 220, location: "London", furnishing_type: "Wall Art"},
  { title: "Vintage Table Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "2-Seater Sofa Bed", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Kilim Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Desk Chair", description: "1960s Rattan Bamboo Chair", price: 120, location: "London", furnishing_type: "Chair"},
  { title: "Floral Print", description: "Print with white frame", price: 220, location: "London", furnishing_type: "Wall Art"},
  { title: "Pair of Lamps", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "French Carved Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Contemporary Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
  { title: "Brown Leather Chair", description: "1960s Rattan Bamboo Chair", price: 120, location: "London", furnishing_type: "Chair"},
  { title: "Art Deco Print", description: "Print with white frame", price: 220, location: "London", furnishing_type: "Wall Art"},
  { title: "Italian Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "Rome", furnishing_type: "Lamp" },
  { title: "Space Age Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Turkish Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"},
]

furnishing_attributes.each do |furnishing_attribute|
  user_attribute = {user_id: user.id}
  furnishing = Furnishing.new(furnishing_attribute.merge(user_attribute))

  file = URI.open("https://source.unsplash.com/featured/?furniture")
  furnishing.photo.attach(io: file, filename: "chairs", content_type: file.content_type_parse.first)
  furnishing.save!
end

puts "Created 32 furnishings"

user2 = User.create!(email: "timmy@gmail.com", password: "123456")

puts "Created a user with email: timmy@gmail.com and password: 123456"

furnishing_attributes = [
  { title: "Mid-Century Floor Lamp", description: "Beautiful Lamp from the 1960s", price: 100, location: "London", furnishing_type: "Lamp" },
  { title: "Parker Knoll Sofa", description: "Vintage Green 2-seater Sofa", price: 320, location: "Paris", furnishing_type: "Sofa"},
  { title: "Persian Rug", description: "Vintage handmade, red rug", price: 400, location: "London", furnishing_type: "Rug"}, { title: "Danish Glass Vases", description: "3 Antique Green Vases", price: 50, location: "Germany", furnishing_type: "Vase"}
]

furnishing_attributes.each do |furnishing_attribute|
  user_attribute = {user_id: user2.id}
  furnishing = Furnishing.new(furnishing_attribute.merge(user_attribute))

  file = URI.open("https://source.unsplash.com/featured/?furniture")
  furnishing.photo.attach(io: file, filename: "chairs", content_type: file.content_type_parse.first)
  furnishing.save!
end
