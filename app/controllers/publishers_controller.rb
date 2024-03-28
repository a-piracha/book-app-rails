class PublishersController < ApplicationController

    def index
        @publishers = Publisher.all
    end

    def new
        @publisher = Publisher.new
    end

    def create
        @publisher = Publisher.new(publisher_params)
        if @publisher.save
            redirect_to publishers_path, notice:"Publisher Added Successfully"
        else
            flash.now[:danger] = @publisher.errors.messages
            render "new", status: :unprocessable_entity
        end
    end

    def edit
                
        @publisher = Publisher.find(params[:id])
    end

    def update

        @publisher = Publisher.find(params[:id])
        if @publisher.update(publisher_params)
            redirect_to edit_publisher_path,  notice:"Publisher Updated Successfully"
        else
            flash.now[:danger] = @publisher.errors.messages
            render "edit", status: :unprocessable_entity
        end
    end

    def destroy
        @publisher = Publisher.find(params[:id])
        if @publisher.destroy
            redirect_to publisher_path
        else
            render new
        end
    end

    private
    def publisher_params
        params.require(:publisher).permit(:name,:address)
    end
end