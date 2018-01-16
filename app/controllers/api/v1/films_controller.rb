class Api::V1::FilmsController < ApplicationController
    include Sortable

    def index
        @films = Film.order(sorting_params(params))
    end
    
    def show
       @film = Film.find(params[:id])
    end
    
end
