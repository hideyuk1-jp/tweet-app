class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, -> { order('created_at DESC') }, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :commented_users, -> { order('created_at DESC') }, through: :comments, source: :user

  validates :content, {presence: true, length: { maximum: 140 }}
  validates :user_id, {presence: true}
end
