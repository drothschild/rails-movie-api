class Api::V1::FilmsController < ApplicationController
    include Sortable
    def index
        @films = Film.order(sorting_params(params)).all
    end
    
    def show
       @film = Film.find(params[:id])
    end
end
