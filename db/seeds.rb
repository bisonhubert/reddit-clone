User.create!(username:  "_bison__",
             email: "bison@bison.bison",
             password:              "123456",
             password_confirmation: "123456")

9.times do |n|
  username  = Faker::Internet.user_name(5..15)
  email = Faker::Internet.email
  password = "123456"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end