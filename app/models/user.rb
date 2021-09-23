class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name,presence: { message: 'error' }
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end
