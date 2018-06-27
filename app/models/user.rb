class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :authentication_token, uniqueness: true

  has_many :likes
  has_many :posts, through: :likes

  def likes?(post)
    likes.find_by(post_id: post.id).present?
  end
end
