FactoryBot.define do
  password = 'password'
  full_name = 'john doe'
  factory :user do
    full_name { Faker::Name.name[1..20] }
    username { Faker::Internet.username[1..20] }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }

    after(:build) do |user|
      user.photo.attach(io: File.open(Rails.root.join('spec', 'support','assets', 'test-photo.jpeg')), filename: 'test-photo.jpeg', content_type: 'image/jpeg')
      user.cover_image.attach(io: File.open(Rails.root.join('spec', 'support','assets', 'test-cover-image.jpg')), filename: 'test-cover-image.jpg', content_type: 'image/jpg')
    end
  end
end
