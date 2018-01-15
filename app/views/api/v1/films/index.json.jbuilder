json.data do
    json.array! @films do |film|
        json.partial! "api/v1/films/film", film: film
    end
end

json.links @links
