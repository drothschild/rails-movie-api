class Film < ApplicationRecord
    
    has_many :film_relationships, foreign_key: :from_film_id
    has_many :related_films, through: :film_relationships, source: :from_film

    has_many :ratings

    def average_rating
        ratings.average(:score)
    end
end