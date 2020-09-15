class Event < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :date, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :participants, dependent: :destroy
end
