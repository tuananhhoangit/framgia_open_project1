User.create! name: "Admin", email: "admin@example.com",
  password: "123123", password_confirmation: "123123", is_admin: true

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

users = User.order(:created_at).take Settings.micropost.number_of_users
20.times do
  title = Faker::Lorem.sentence Settings.micropost.title_lorem_sentences
  content = Faker::Lorem.sentence Settings.micropost.content_lorem_sentences
  users.each {|user| user.microposts.create! title: title, content: content}
end
