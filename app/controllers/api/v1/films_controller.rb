class Api::V1::FilmsController < ApplicationController
    require 'FilmsIndex'

    def index
      films_index = FilmsIndex.new(self)
      @links = films_index.links
      @films = films_index.films
    end
    
    def show
       @film = Film.find(params[:id])
    end
end
