class UserBooksController < ApplicationController
    def create
        @user_book = UserBook.new(user_id:params[:user_id],book_id:params[:book_id],completed:params[:completed])
        authorize @user_book
        if @user_book.save
          redirect_to books_path
        else
            render plain:"some thing went wrong"
        end
    end

    def update
        @user_book = UserBook.find(params[:id])
        authorize @user_book
        @user_book.completed = params[:completed]
        if @user_book.save
            redirect_to books_path
        else
            render plain:"some thing went wrong"
        end
    end
    
end
