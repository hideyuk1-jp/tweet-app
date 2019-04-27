class Post < ApplicationRecord
  validates :content, {presence: true, length: { max: 140 }}
  validates :user_id, {presence: true}
end
