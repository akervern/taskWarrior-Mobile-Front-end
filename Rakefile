require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

task :default => [:dev]

# Run Sinatra in dev mode
task :dev do
  ruby "taskMobile.rb"
end

# RSpec tasks
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = FileList['tests/**/*.rb']
  t.rspec_opts = "--color"
end

RSpec::Core::RakeTask.new(:doc) do |t|
  t.pattern = FileList['tests/**/*.rb']
  t.rspec_opts = "--color --format doc"
end

# Thin tasks
task :clean_thin do
  Dir.glob("app/*.log").each do |file|
    File.delete(file)
  end
end

task :start => :clean_thin do
  exec "thin -s 2 -C config.yml -R config.ru start"
end

task :stop do
  exec "thin -s 2 -C config.yml -R config.ru stop"
end
