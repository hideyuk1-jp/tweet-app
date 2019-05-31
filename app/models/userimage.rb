class Userimage < ApplicationRecord
  belongs_to :user
  validates :user_id, {presence: true, uniqueness: true}
  validates :picture, {presence: true}
end
