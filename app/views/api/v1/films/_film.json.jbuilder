json.type 'films'
json.id film.id
json.attributes do 
  json.title film.title
  json.description film.description
  json.url_slug film.url_slug
  json.year film.year
  json.average_rating film.average_rating
end
json.relationships do
    json.related_films do
         json.data film.related_films do |rf|
            json.type "films"
            json.id rf.id
        end
    end 
end