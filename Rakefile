begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

ENV['HEADHUNTER'] ||= 'true' # Normally, headhunter is only loaded when submitting HEADHUNTER=true on the command line. For sake of simplicity, we activate it here generally.

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Headhunter'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each { |f| load f }

require 'rspec/core'
require 'rspec/core/rake_task'

desc 'Run all specs in spec directory (excluding plugin specs)'
RSpec::Core::RakeTask.new(:spec)

task default: :spec
