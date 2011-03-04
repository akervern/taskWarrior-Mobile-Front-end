require "rubygems"
require "sinatra"

get '/' do
  "http://taskwarrior.org/ front-end powered by Sinatra"
end

get '/task/:name' do
  "Display task for #{params[:name]} !"
end

get '/task/:name/:id' do
  "Display task for #{params[:name]} with id #{params[:id]} !"
end
