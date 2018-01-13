class Api::V1::FilmsController < ApplicationController
    def index
      @films = Film.all  
    end
    def show
       @film = Film.find(params[:id])
    end

end
