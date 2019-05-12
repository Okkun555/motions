class Menu < ApplicationRecord
  validates :training_event, presence: true, length: { maximum: 20 }
  belongs_to :log, inverse_of: :menus
end
