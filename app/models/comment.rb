class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true
  validates :from_user_id, presence: true
end
