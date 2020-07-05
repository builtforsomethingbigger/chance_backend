class DonationsController < ApplicationController
    def index
        donations = Donation.all
        render json: donations
    end
    
    def new
        donation = Donation.new
    end
    
    def create
        donation = Donation.create!(donation_params)
        render json: donation
    end
    
    def update
        donation = Donation.find(params[:id])
        donation.update(donation_params)
        render json: donation
    end
    
    def show
        donation= Donation.find(params[:id])
        render json: donation
    end
    
    private
    def donation_params
        params.require(:donation).permit(:user_id, :charity_id, :donation_amount, :donation_date, :donation_note)
    end
end
