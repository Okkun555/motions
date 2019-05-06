FactoryBot.define do
  factory :log do
    today { "2019-05-06" }
    training { "MyText" }
    memo { "MyString" }
    weight { 1.5 }
  end
end
