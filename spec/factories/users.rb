FactoryGirl.define do
  factory :user do
    username "testuser"
    email "test@user.com"
    password "test1234%"
    password_confirmation "test1234%"
  end
end
