class Api::V1::FilmsController < ApplicationController

    def index
      Film.all  
    end

    def show
        Film.find(params[:id])
    end
    
end
