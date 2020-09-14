class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
end
