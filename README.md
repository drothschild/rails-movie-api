# README

Simple Film Database API in JSON using a Rails api. Sortable by title and year.

## Instructions

1. Clone the repo and navigate to this folder in your console
1. Console: ``bundle install``
1. Console: ``rails db:create``
1. Console: ``rails db:migrate``
1. Console: ``rails db:seed``
1. Console: ``rails s``
1. Open local host in your browser

## Urls

All films: /api/v1/films

View a film: /api/v1/films/:id

Rate a film: POST to /api/v1/ratings
``{ "rating": { "film_id": :id, "score": :score} }``