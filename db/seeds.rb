puts "Let's seed!"

puts "Cleaning up..."
Restaurant.destroy_all

10.times do |index|
  resto = Restaurant.create(
    name: Faker::Restaurant.name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number
    )
  5.times do
    puts "Creating new review for #{resto.name}!"
    Review.create(
      content: Faker::Lorem.paragraph,
      rating: (1..5).to_a.sample,
      restaurant_id: resto.id
    )
  end
end

puts 'All done!'
