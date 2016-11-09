require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './app.rb'

class AppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def test_get_a_page_to_ask_for_a_username
    get "/"
    assert last_response.ok?
    assert_match(/enter a username/, last_response.body)
  end

  def test_can_lookup_weather_for_a_zip
    get "/repositories", {username: "rposborne"}
    assert_equal last_response.status, 200
    assert_match(//, last_response.body)
  end

end
