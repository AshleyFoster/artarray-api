class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes

  validates :title, presence: true
  validates :description, presence: true

  def likes_count
    self.likes.count
  end

  def liked
    self.likes.where(user_id: user.id).any?
  end
end
