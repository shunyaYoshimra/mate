class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :post,  presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
