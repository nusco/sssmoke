require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new {|t| t.test_files = FileList['test/test*.rb'] }

task :default => :test
