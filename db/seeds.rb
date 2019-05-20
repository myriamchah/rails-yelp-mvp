Restaurant.destroy_all

5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    category: [ "chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address)
 end
