class Book < ApplicationRecord
    has_many :users, through: :user_books
    has_many :user_books
end
