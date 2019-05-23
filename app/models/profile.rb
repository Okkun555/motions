class Profile < ApplicationRecord
  validates :user_profile, length: { maximum: 400 }

  belongs_to :user
end
