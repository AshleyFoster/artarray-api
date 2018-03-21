FactoryBot.define do
  factory :post do
    title "MyString"
  end

  factory :user do
    email "foo@bar.baz"
    password "password"
  end
end
