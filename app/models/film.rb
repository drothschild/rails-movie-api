class Film < ApplicationRecord   
    has_many :film_relationships, foreign_key: :from_film_id, dependent: :destroy
    has_many :related_films, through: :film_relationships, source: :to_film

    has_many :ratings, dependent: :destroy

    def average_rating
        ratings.average(:score)
    end
end