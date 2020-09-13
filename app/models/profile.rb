class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :avatar
  validates :profile, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
