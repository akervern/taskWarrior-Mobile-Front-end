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

post '/task/add' do
  TaskSplitter.new.addTask(params[:task], params[:project], params[:dueDate])
  redirect '/task'
end

get '/task/done/:id' do
  TaskSplitter.new.doneTask params[:id]
  redirect '/task'
end

get '/task/:name' do
  "Display task for #{params[:name]} !"
end
