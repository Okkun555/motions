class Log < ApplicationRecord
  validates :training_day, presence: true
  validates :training_menu, presence: true
  validates :memo, length: { maximum: 100 }

  belongs_to :user
end
