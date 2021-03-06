# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Film.destroy_all
FilmRelationship.destroy_all
Rating.destroy_all

Film.create([
  {
    title: "A Wonderful Film",
    description: "A cute film about lots of wonderful stuff.",
    url_slug: "a_wonderful_film",
    year: 1973
  },
  {
    title: "All About Fandor",
    description: "Documentary telling the tail of Fandor.",
    url_slug: "all_about_fandor",
    year: 2001 
  },
  {
    title: "Dancing with Elephants",
    description: "The classic tale of Dancing with Wolves, but with elephants!",
    url_slug: "dancing_with_elephants",
    year: 2016
  },
  {
    title: "The Story of George",
    description: "A true story outlining the adventures of George.",
    url_slug: "the_story_of_george",
    year: 1974
  },
  {
    title: "Zee and Bee Go Skiing",
    description: "The tragic story of Zoe and Bee on their snowy adventures.",
    url_slug: "zee_and_bee_go_skiing",
    year: 1991
  },
  {
    title: "Ahead of its Time",
    description: "A story about the future.",
    url_slug: "ahead_of_its_time",
    year: 2088 
  },
  {
    title: "My Name is Jerry",
    description: "The life of the cat named Jerry.",
    url_slug: "my_name_is_jerry",
    year: 1989
  },
  {
    title: "Gems and Trestle",
    description: "Is it about web development? Mining history? You'll never know.",
    url_slug: "gems_and_trestle",
    year: 2011
  },
  {
    title: "How to React Natively",
    description: "A step by step journey through developing a React Native application",
    url_slug: "how_to_react_natively",
    year: 2000 
  },
  {
    title: "Perry Hotter: A Lizard's Tale",
    description: "It's a story all about a lizard named Perry.",
    url_slug: "perry_hotter_a_lizards_tale",
    year: 2017
  }
])

Film.all.each do |film|
    other_films = Film.all.select{|f| f[:id] != film.id}
    film.related_films = other_films.sample(rand(3))
    10.times do
        film.ratings.push(Rating.create({score:1 + rand(5)}))
    end
end