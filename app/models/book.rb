class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    has_many :users, through: :user_books
    has_many :user_books
end
