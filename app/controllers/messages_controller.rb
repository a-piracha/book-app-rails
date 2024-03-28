class MessagesController < ApplicationController

    def new
      @messages = Message.all
    end


    def create
      current_user = User.find_by_id(params[:id])
       second_user = User.find(params[:receiver_id])
       content = params[:message]
      #  binding.pry

        @message = Message.create(current_user,second_user.id,content)
        if @message
          redirect_to user_path, notice: "Message sent!"
        else
          render "new"
        end
    end
    
    private 

    def message_params
        params.require(:message).permit(:receiver_id, :message)
    end
end