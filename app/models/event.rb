class Event < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :date, presence: true
  validates :paid, presence: true
  validates :price, presence: true
end
