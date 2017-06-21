User.create! name: "Admin", email: "admin@example.com",
  password: "123123", password_confirmation: "123123", is_admin: true

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end
