class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
            
        @user = User.new(user_params)
        if @user.save
            redirect_to chat_app_path
        else
            render "new"
        end
    end

    def show
        @user = User.find(params[:id])
        @users = User.all
    end

    def sendmessage        
        @messages = User.find(params[:id])
    end


    private
    def user_params
        params.require(:user).permit(:name,:email)
    end
end