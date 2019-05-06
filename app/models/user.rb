class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, -> { order('created_at DESC') }, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :commented_posts, -> { order('created_at DESC') }, through: :comments, source: :post

  validates :name, {presence: true, length: { in: 1..20 }}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}
  has_secure_password
  validates :password, {presence: true, length: { in: 6..20 }, allow_nil: true}

end
