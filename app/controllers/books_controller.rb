class BooksController < ApplicationController
    
    def index
        @books = Book.all
        authorize @books
    end
    
    def show
        @book = Book.find(params[:id])
        authorize @book
    end

    def new
        @book = Book.new
        authorize @book
    end

    def create
      @book = Book.new(book_params)
      authorize @book
      if @book.save
        redirect_to books_path
      else
        redirect_to new_user_path
      end
    end

    def edit
        @book = Book.find(params[:id])
        authorize @book
    end

    def update
      @book = Book.find(params[:id])
      authorize @book
      if @book.update(book_params)
        redirect_to book_path(@book)
      else
        redirect_to edit_book_path(@book)
      end     
    end
    
    def destroy
      @book = Book.find(params[:id])
      authorize @book
      @book.destroy
      redirect_to books_path
    end
    
    private
      def book_params
        params.require(:book).permit(:title, :author)
      end
end
