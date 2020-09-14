class Post < ApplicationRecord
  belongs_to :user
  validates :post,  presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
