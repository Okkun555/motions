FactoryBot.define do
  factory :profile do
    user_profile { 'Hello everyone' }
    gim_training { 'true' }
    house_training { 'true' }
    weight_training { 'true' }
    bodyweight_training { 'true' }
    diet { 'true' }
    body_make { 'true' }
    power { 'true' }
  end
end
