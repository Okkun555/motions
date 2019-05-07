FactoryBot.define do
  factory :log do
    training_day { '2019/05/01' }
    training_menu { 'ベンチプレス100kg：10回'}
    memo { 'test' }
  end
end
