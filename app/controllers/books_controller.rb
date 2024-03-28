class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create        
            
        @genres = Genre.where(id:params[:book][:genre_id])
        @book = Book.new(book_params)
        @book.genres = @genres
        if @book.save
            redirect_to books_path, notice:"Book Added Successfully"
        else
            flash.now[:danger] = @book.errors.messages
            render "new", status: :unprocessable_entity
        
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update        
        @genres = Genre.where(id:params[:book][:genre_id])
        @book = Book.find(params[:id])
        @book.genres = @genres
        if @book.update(book_params)
            redirect_to books_path, notice:"Book Updated Successfully"

        else
            flash.now[:danger] = @book.errors.messages
            render "edit", status: :unprocessable_entity
        end
    end

    def show
        
        
        @book = Book.find(params[:id])
        @author_name = Author.find_by_id(@book.author_id).name
        if @book.publisher_id
            @publisher_name = Publisher.find_by_id(@book.publisher_id).name
        end
        @genres = @book.genres
        
    end

    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            redirect_to books_path
        else
            render new
        end
    end

    private
    def book_params
        params.require(:book).permit(:name,:description,:price,:author_id,:publisher_id)
    end

end