class InboxesController < ApplicationController
    def index
        inboxes = Inbox.all
        render json: inboxes
    end
    
    def new
        inbox = Inbox.new(params[:id])
        render json: inboxs
    end
    
    def create
        inbox = Inbox.create(inbox_params)
        render json: inbox
    end
    
    def edit
        inbox = Inbox.find(params[:id])
        render json: inbox
    end
    
    def update
        inbox = Inbox.find(params[:id])
        inbox.update(inbox_params)
        render json: inbox
    end
    
    def show
        inbox = Inbox.find(params[:id])
        render json: inbox
    end
    
    def destroy
        Inbox.destroy
        render json: inbox
    end


    private
    def inbox_params
        params.require(inbox).permit(:user_id, :message_id)
    end

end