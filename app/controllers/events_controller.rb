class EventsController < ApplicationController
    def index
        events = Event.all
        render json: events
    end
    
    def new
        event = Event.new
    end
    
    def create
        event = Event.create(event_params)
        render json: event
    end
    
    def edit
        event = Event.find(params[:id])
        render json: event
    end
    
    def update
        event = Event.find(params[:id])
        event.update(event_params)
        render json: event
    end
    
    def show
        event = Event.find(params[:id])
        render json: event
    end
    
    def destroy
        Event.destroy
        render json: event
    end


    private
    def event_params
        params.require(:event).permit(:user_id, :charity_id, :event_date, :event_title, :event_type, :event_description)
    end
end
