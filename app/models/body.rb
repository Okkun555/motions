class Body < ApplicationRecord
  validates :date, presence: true
  validates :length, presence: true, numericality: { greater_than: 100}
  validates :weight, presence: true, numericality: { greater_than: 10}
  validates :fat_percentage, numericality: { greater_than: 1, less_than: 70}, allow_nil: true
  belongs_to :user
end
