USERS_TO_CREATE = 20
USERS_TO_CREATE.times do
	User.create!(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: Faker::Internet.password
	)
end

AUCTIONS_TO_CREATE = 30
AUCTIONS_TO_CREATE.times do
	Auction.create!(
		title: Faker::Food.ingredient,
		details: Faker::ChuckNorris.fact,
		date: Faker::Time.between(DateTime.now, DateTime.now+10),
		price: Faker::Commerce.price
	)
end

puts "Seed complete"
