puts "Let's seed!"

puts "Cleaning up..."
Restaurant.destroy_all

5.times do |index|
  Restaurant.create(
    name: Faker::Restaurant.name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number
    )
end

puts 'All done!'
