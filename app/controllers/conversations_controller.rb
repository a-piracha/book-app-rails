class ConversationsController < ApplicationController

    def new
        @sender_id   = User.find(params[:sender_id])
        @receiver_id = User.find(params[:receiver_id])
      
        if User.exists?(@sender_id.id) && User.exists?(@receiver_id.id)
          @conversation = Conversation.find_by(sender_id: @sender_id.id, receiver_id: @receiver_id.id) || Conversation.find_by(sender_id: @receiver_id.id, receiver_id: @sender_id.id)
      
          unless @conversation            
            @conversation = Conversation.create(sender_id: @sender_id.id, receiver_id: @receiver_id.id)
          end
        end
    end
      

    def create
        @conv1 = Conversation.find_by(sender_id: params["sender_id"], receiver_id: params["receiver_id"])
        @conv2 = Conversation.find_by(sender_id: params["receiver_id"], receiver_id: params["sender_id"])

        if @conv1
            @conv1.messages.create(conversation_id:@conv1.id, sender_id:params["sender_id"], content:params[:content])
            redirect_to new_conversation_path(sender_id: params["sender_id"], receiver_id: params["receiver_id"])
        end
        if @conv2
            @conv2.messages.create(conversation_id:@conv2.id, sender_id:params["sender_id"], content:params[:content])
            redirect_to new_conversation_path(sender_id: params["receiver_id"], receiver_id: params["sender_id"])

        end
    end
end