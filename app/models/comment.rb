class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, :post_id, presence: true
  validates :user_id, uniqueness: { scope: :post_id }
  validates :content, {presence: true, length: { maximum: 140 }}
end
