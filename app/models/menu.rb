class Menu < ApplicationRecord
  validates :training_event, presence: true, length: { maximum: 20 }
  belongs_to :log, inverse_of: :menus

  def calculate_1rm
    rm = training_weight * (1 + reps / 40.to_f)#なぜto_fが必要なのか？
  end
end
