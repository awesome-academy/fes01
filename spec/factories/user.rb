FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.subscriber_number(10)}
    password {"123456"}
    password_confirmation {"123456"}
    role {"subscriber"}
  end
end
