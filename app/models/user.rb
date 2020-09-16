class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name:  'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def following?(other_user)
    active_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    active_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end
end
