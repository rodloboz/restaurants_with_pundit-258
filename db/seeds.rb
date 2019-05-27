puts "Cleaning up DB..."
[Restaurant, User].each(&:destroy_all)

puts "Creating users..."
USERS = [
  {
    email: 'john@gmail.com',
    password: '123456'
  },
  {
    email: 'susan@gmail.com',
    password: 'password'
  }
]

User.create!(USERS)

puts "Creating reataurants..."
User.find_each { |u| u.restaurants.create!(name: Faker::Company.name) }
