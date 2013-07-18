require "bundler/gem_tasks"
require "rake/testtask"

task default: [:build, :test]

task :deploy do
  Rake::Task[:build].execute
  Rake::Task[:test].execute
  sh "gem push framingham.gem"
end

task :upgrade do
  Rake::Task[:build].execute
  Rake::Task[:test].execute
  begin
    sh "gem uninstall framingham && gem install ./framingham.gem"
  rescue => exception
    abort "\033[31merror: did you not sudo? \033[0m"
  end
end

Rake::TestTask.new { |_|
  _.test_files = FileList['framingham/*_tests.rb']
  _.verbose = true
}
