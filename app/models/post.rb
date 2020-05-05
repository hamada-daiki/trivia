class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :comment
  has_many :like

  mount_uploader :img, ImgUploader

  def user
    User.find_by(id: self.user_id)
  end
end
