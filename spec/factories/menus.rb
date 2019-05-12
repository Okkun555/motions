FactoryBot.define do
  factory :menu do
    training_event { 'ベンチプレス' }
    training_weight { '100' }
    reps { '10' }
    training_time { '60' }
    distance { '3' }
  end
end
