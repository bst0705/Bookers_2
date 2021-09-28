class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments,dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title,presence: { message: 'error' }

  validates :body,presence: { message: 'error' }
  validates :body,length: { maximum: 200 }


end
