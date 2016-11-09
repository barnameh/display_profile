require 'httparty'
require 'bundler/setup'
require 'pry'

class RepositoryList
  def get(username)
    HTTParty.get("https://api.github.com/users/#{username}/repos")
  end
end
