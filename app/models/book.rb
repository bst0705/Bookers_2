class Book < ApplicationRecord

  belongs_to :user


  validates :title,presence: { message: 'error' }

  validates :body,presence: { message: 'error' }
  validates :body,length: { maximum: 200 }


end
