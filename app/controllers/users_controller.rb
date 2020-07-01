class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
    
    def new
        user = User.new
        render json: user
    end
    
    def create
        user = User.create!(user_params)
        render json: user
    end
    
    def edit
        user = User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end
    
    def show
        user= User.find(params[:id])
        render json: user
    end
    
    def destroy
        User.destroy
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :dob, :email_address, 
            :password, :street_address, :street_address_2, :city, :zip,
            :phone_number, :cc_number, :cc_exp_date, :cc_type, :total_donation
        )
    end
end
