class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all
    end

    def new
    end

    def create
        restaurant = Restaurant.create(permit_params)
        redirect_to restaurant
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        flash.keep[:restaurant_id] = params[:id]
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end
    
    def update
        restaurant = Restaurant.find(params[:id])
        restaurant.update(permit_params)
        redirect_to restaurant
    end
    
    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        redirect_to restaurants_path
    end

    def permit_params
        params.require(:restaurant).permit(:restaurant_type, :username, :password_digest, :name, :street_address, :zip, :phone_number, :rating, :description, :img_url)
    end

    def next_id
        if (self.id + 1 == Restaurant.last.id + 1)
            next_id = Restaurant.first.id
        else next_id = self.id + 1
        end
    end
    
    def back_id
        if (self.id - 1 == Restaurant.first.id - 1) 
            back_id = Restaurant.last.id
        else back_id = self.id - 1
        end
    end
end