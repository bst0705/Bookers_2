class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  has_many :book_comments, dependent: :destroy
  
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following
  
  attachment :profile_image

  validates :name,presence: { message: 'error' }
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end
