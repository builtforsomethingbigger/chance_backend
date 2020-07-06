class MessagesController < ApplicationController
    def index
        messages = Message.all
        render json: messages.to_json(:include => {
            :user => {:only => [:id, :username, :first_name, :last_name]}
        }, except: [:created_at, :updated_at])
    end

    def new
        message = Message.new(params[:id])
        render json: messages
    end
    
    def create
        message = Message.create(message_params)
        render json: message
    end
    
    def edit
        message = Message.find(params[:id])
        render json: message
    end
    
    def update
        message = Message.find(params[:id])
        message.update(message_params)
        render json: message
    end
    
    def show
        message = Message.find(params[:id])
        render json: message
    end
    
    def destroy
        Message.destroy
        render json: message
    end


    private
    def message_params
        params.require(message).permit(:message_title, :message_body)
    end
end
