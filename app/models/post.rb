class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :content, presence: true
  validates :user_id, presence: true
end
