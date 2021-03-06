class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :admin, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  has_many :books, through: :user_books
  has_many :user_books

end
