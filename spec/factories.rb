FactoryBot.define do
  factory :like do
    user
    post
  end

  factory :post do
    title "Title"
    description "Description"

    user
  end

  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.baz" }
    password "password"
  end
end
