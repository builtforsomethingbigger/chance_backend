class FavoritesController < ApplicationController
    def index
        favorites = Favorite.all
        render json: favorites
    end
    
    def new
        favorite = Favorite.new
        render json: favorite
    end
    
    def create
        favorite = Favorite.create(favorite_params)
        render json: favorite
    end
    
    def edit
        favorite = Favorite.find(params[:id])
    end
    
    def update
        Favorite.update(favorite_params)
    end
    
    def show
    
    end
    
    def destroy
        Favorite.destroy
    end

    private
    def favorite_params
        params.require(:favorite).permit(:user_id, :charity_id)
    end
end
