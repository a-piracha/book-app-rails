class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def new
        @genre = Genre.new
    end

    def create
        @books = Book.where(id:params[:genre][:book_id])
        @genre = Genre.new(genre_params)
        @genre.books = @books
        if @genre.save
            redirect_to genres_path ,notice:"Genre Added Successfully"

        else
            flash.now[:danger] = @genre.errors.messages
            render "new", status: :unprocessable_entity
        end
    end

    def edit        
        @genre = Genre.find(params[:id])
    end

    def update
        @books = Book.where(id:params[:genre][:book_id])
        @genre = Genre.find(params[:id])
        @genre.books = @books

        if @genre.update(genre_params)
            redirect_to genres_path, notice:"Genre Updated Successfully"

        else
            flash.now[:danger] = @genre.errors.messages
            render "edit", status: :unprocessable_entity
        end
    end

    def destroy
        @genre = Genre.find(params[:id])
        if @genre.destroy
            redirect_to genres_path
        else
            render new
        end
    end

    def show
    
        @genre = Genre.find(params[:id])
        @books = @genre.books
    end

    private
    def genre_params
        params.require(:genre).permit(:name)
    end
end