FactoryBot.define do
  factory :following do
    association :follower, factory: :user
    association :followed, factory: :user
  end
end