FactoryBot.define do
  factory :like do
  end

  factory :post do
    title "Title"
    description "Description"
  end

  factory :user do
    email "foo@bar.baz"
    password "password"
  end
end
