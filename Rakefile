require "bundler/gem_tasks"
require "rake/testtask"

task :default => [:build]

task :build do
  "bundle install framingham"
end

Rake::TestTask.new { |_|
  _.libs << 'framingham'
  _.test_files = FileList['framingham/*_tests.rb']
  _.verbose = true
}
