User.destroy_all
Post.destroy_all

test_user = User.create!(username:  "_bison__",
             email: "bison@bison.bison",
             password:              "123456",
             password_confirmation: "123456")

5.times do
  title = Faker::GameOfThrones.character + " in " + Faker::GameOfThrones.city
  content = Faker::Lorem.paragraph
  test_user.posts.create!(title: title, content: content)
end

9.times do |n|
  username  = Faker::Internet.user_name(5..15)
  email = Faker::Internet.email
  password = "123456"
  user = User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
  rand(1..5).times do
    title = Faker::TwinPeaks.quote
    content = Faker::Lorem.paragraph
    user.posts.create!(title: title, content: content)
  end
end