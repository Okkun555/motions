FactoryBot.define do
  factory :user do
    name { 'userA' }
    email { 'a@example.com' }
    password_digest { 'password' }
    profile { "MyText" }
  end
end
