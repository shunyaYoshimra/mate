class House < ApplicationRecord
  has_many :people
  has_many :users, through: :people
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, presence: true, length: { maximum: 255 }
  validates :prefecture, presence: true
  has_many_attached :pictures
end
