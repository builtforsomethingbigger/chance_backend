class CharitiesController < ApplicationController
    def index
        charities = Charity.all
        render json: charities
    end
    
    def new
    
    end
    
    def create
        charity = Charity.create!(charity_params)
        render json: charity
    end
    
    def edit
    
    end
    
    def update
        charity = Charity.find(params[:id])
        charity.update(charity_params)
        render json: charity
    end
    
    def show
    
    end
    
    def destroy
    
    end


    private
    def charity_params
        params.require(:charity).permit(:charity_name, :ein, :tag_line, :website_url, :current_rating, 
            :financial_rating, :accountability_rating, :cause, :income_amount, :mailing_street_address,
            :mailing_street_address_2, :mailing_city, :mailing_zipcode, :created_at, :updated_at
        )
    end

end
