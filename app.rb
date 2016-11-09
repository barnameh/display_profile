require 'sinatra'
require 'erb'
require 'pry'
require_relative 'repository_list'

helpers do
  def render_template(filename)
    template = File.read(filename)
    ERB.new(template).result(binding)
  end
end

get "/" do
  @number = rand
  render_template("index.html.erb")
end

get "/repositories" do
  @repos = RepositoryList.new.get(params["username"])
  @avatar = @repos[0]["owner"]["avatar_url"]
  render_template("profile.html.erb")
end
