class FilmRelationship < ApplicationRecord
    validates :from_film_id, presence: true
    validates :related_id, presence: true

    belongs_to :from_film, class_name :Film

    belongs_to :to_film, class_name :Film
end