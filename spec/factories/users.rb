FactoryBot.define do
  factory :user do
    name { 'userA' }
    email { 'a@example.com' }
    password { 'password' }
    profile { 'Hello everyone' }
  end
end
