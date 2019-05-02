class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  validates :name, {presence: true, length: { in: 1..20 }}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}
  validates :password, {presence: true, length: { in: 6..20 }}
end
