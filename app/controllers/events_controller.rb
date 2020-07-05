class EventsController < ApplicationController
    def index
        events = Event.all
        render json: events
    end
    
    def new
        event = Event.new(params[:id])
        render json: events
    end
    
    def create
        event = Event.create(event_params)
        render json: events
    end
    
    def edit
        event = Event.find(params[:id])
        render json: events
    end
    
    def update
        event = Event.find(params[:id])
        event.update(event_params)
        render json: events
    end
    
    def show
        event = Event.find(params[:id])
        render json: events
    end
    
    def destroy
        Event.destroy
        render json: events
    end


    private
    def event_params
        params.require(event).permit(:charity_id, :event_date, :event_title, :event_type, :event_description)
    end
end
