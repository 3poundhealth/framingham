require "bundler/gem_tasks"
require "rake/testtask"

task default: [:build, :test]

task :deploy do
  Rake::Task[:build].execute
  Rake::Task[:test].execute
  sh "gem push framingham.gem"
end

Rake::TestTask.new { |_|
  _.test_files = FileList['framingham/*_tests.rb']
  _.verbose = true
}
