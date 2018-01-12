json.array! @films do |film|
    json.partial! "api/v1/films/film", film: film
end