class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes

  validates :title, presence: true
  validates :description, presence: true
end
