require 'test_helper'

class FilmTest < ActiveSupport::TestCase
   test "should allow associations" do       
        a = Film.new(title: "a")
        b = Film.new(title: "b")
        a.related_films.push(b)
        assert_equal(a.related_films[0], b)     
    end

    test "should average ratings" do
      a = Film.new(title: "a")
      a.ratings.push(Rating.new(score:1))
      a.ratings.push(Rating.new(score:3))
      assert_equal(2, a.average_rating)
    end
end
