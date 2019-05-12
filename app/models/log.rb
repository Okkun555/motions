class Log < ApplicationRecord
  validates :training_day, presence: true
  validates :training_title, presence: true, length: { maximum: 20 }
  validates :comment, length: { maximum: 400 }

  belongs_to :user
  has_many :menus, inverse_of: :log
  accepts_nested_attributes_for :menus
end
