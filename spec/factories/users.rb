FactoryBot.define do
  password = 'password'
  full_name = 'john doe'
  factory :user do
    full_name { Faker::Name.name[1..20] }
    username { Faker::Name.name[1..20] }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
