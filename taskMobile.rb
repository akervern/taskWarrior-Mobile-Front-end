require "rubygems"
require "sinatra"
require "erb"

require 'TaskHelper.rb'

get '/' do
  "Mobile front-end for taskWarrior"
end

get '/task' do
  split = TaskSplitter.new
  res = split.list
  @lines = Array.new
  split.each_line(res) do |line|
    @lines.push split.fillTaskHolder line
  end

  erb :task_list
end

get '/task/:name' do
  "Display task for #{params[:name]} !"
end

get '/task/:name/:id' do
  "Display task for #{params[:name]} with id #{params[:id]} !"
end
