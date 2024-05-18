require "sinatra"
require 'sinatra/content_for' # Adds Rails-style content_for helpers to ERB
require 'tilt/erubis'

require_relative "./lib/dog_handler"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true # safety measure?
end

configure(:development) do
  require 'sinatra/reloader'
  also_reload './dog_handler.rb'
end

before do
  @storage = DogHandler.new(logger)
end

get "/" do
  redirect "/dogs"
end

get "/dogs" do
  @dogs = @storage.retrieve_dogs
  erb :home, layout: :layout
end

get "/dogs/new" do
  erb :new_dog, layout: :layout
end

post "/dogs" do
  name = params[:dog_name]
  @storage.add_dog(name)
  redirect "/dogs"
end