class AuthorsController < ApplicationController

    def index
        @authors = Author.all
    end

    def new
        @author = Author.new
        @author.build_biography
    end

    def create        
        @author = Author.new(author_params)

        if @author.save
            redirect_to authors_path, notice:"Author Added Successfully"
        else
            flash.now[:danger] = @author.errors.messages
            render "new", status: :unprocessable_entity
        end
    end


      

    def edit
        @author = Author.find(params[:id])
    end

    def update        
        @author = Author.find(params[:id])
        if @author.update(author_params)
            redirect_to author_path, notice:"Author Updated Successfully"
        else
            flash.now[:danger] = @author.errors.messages
            render "edit", status: :unprocessable_entity
        end
        
    end

    def show
        @author = Author.find(params[:id])
        @authors = Author.all
        @biography = @author.biography

        # @books = Book.find_by_author_id(@author.id)
        @books = Book.where(author_id:@author.id)
        @book = @author.books

    end

    def destroy
        @author = Author.find(params[:id])
        if @author.destroy
            redirect_to authors_path
        else
            render new
        end
    end

    # optional for seperate biography

    def new_bio
        @biographies = Biography.all
    end

    def create_bio

        binding.pry

        author = Author.find(params[:id])
        # @biography = Biography.new(bio_params)
        # @biography.author = author

        @biography = author.build_biography(bio_params)
        if @biography.save
            redirect_to author_path, notice:"Author Biography Added Successfully"
        else
            flash.now[:danger] = @author.errors.messages
            render "new_bio", status: :unprocessable_entity
        end
    end

    def edit_bio
        # binding.pry
        @author = Author.find(params[:id])
        @biography = @author.biography
    end

    def update_bio
        
        # binding.pry
        @author = Author.find(params[:id])
        @biography = @author.biography

        if @biography.update(bio_params)
            redirect_to author_path, notice:"Author Biography Updated Successfully"
        else
            flash.now[:danger] = @author.errors.messages
            render "edit_bio", status: :unprocessable_entity
        end
    end

    private
    def author_params
        params.require(:author).permit(:name,:email,
        biography_attributes: [:id, :age, :cnic, :dob, :bio]
        )
    end

    def bio_params
        params.require(:biography).permit(:age,:cnic,:dob,:bio)
    end
end