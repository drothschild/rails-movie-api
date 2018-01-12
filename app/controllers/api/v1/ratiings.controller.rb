class Api::V1::RatingsController < ApplicationController

    def show
        @rating = Rating.find(params[:id])
    end

    def create
        @rating = Rating.new(rating_params)
        if @rating.save
            render json: @rating
        else
            render json: {errors: @rating.errors.full_messages}, status: 422
        end
    end

    def destroy
        @rating = Rating.find(params[:id])
        @rating.destroy
        render json: {}, status: 200
    end
    
    private

    def rating_params
        params.require(:rating).permit(:score, :film_id)
    end
end
