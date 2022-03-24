# reset database
puts "Reset seed data..."

# create test user
puts "Create test user data..."
10.times do
  User.create!(
    provider: 'email',
    uid: Faker::Internet.email,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
  )
end