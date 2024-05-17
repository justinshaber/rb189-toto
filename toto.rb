require "sinatra"
require "sinatra/reloader" # Extension of Sinatra::Contrib, that reloads modified files
require 'sinatra/content_for' # Adds Rails-style content_for helpers to ERB
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true # safety measure?
end

before do
  @storage = SessionPersistance.new(session)
end

get "/" do
  @dogs = [
    { name: "Duffy" },
    { name: "Ellie" }
  ]
  erb :home, layout: :layout
end