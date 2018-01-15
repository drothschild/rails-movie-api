require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get api_v1_films_url, as: :json
    assert_response :success
  end

  test "should show film" do
    get api_v1_film_url(@film), as: :json
    assert_response :success
  end

end
