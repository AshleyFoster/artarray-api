FactoryBot.define do
  factory :post do
    title "title"
    description "description"
  end

  factory :user do
    email "foo@bar.baz"
    password "password"
  end
end
