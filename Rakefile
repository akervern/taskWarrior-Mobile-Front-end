require 'rake'
require 'rspec/core/rake_task'

task :default => [:startSinatra]

task :startSinatra do
  ruby "taskMobile.rb"
end

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = FileList['tests/**/*.rb']
  t.rspec_opts = "--color"
end

RSpec::Core::RakeTask.new(:doc) do |t|
  t.pattern = FileList['tests/**/*.rb']
  t.rspec_opts = "--color --format doc"
end
