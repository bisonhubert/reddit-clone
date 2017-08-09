class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates_presence_of :content, :title, :user_id
  validates :title, presence: true,
                    length: { minimum: 5 }
end
