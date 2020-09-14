class Post < ApplicationRecord
  validates :content,  presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
