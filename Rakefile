# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sadi-rb"
  gem.homepage = "http://github.com/wstrinz/sadi-rb"
  gem.license = "MIT"
  gem.summary = %Q{Build and run SADI services with ruby-rdf and sinatra}
  gem.description = %Q{Build and run SADI services with ruby-rdf and sinatra}
  gem.email = "wstrinz@gmail.com"
  # gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.authors = ["Will Strinz"]
  gem.version = '0.0.1'
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:test) do |spec|
  spec.rspec_opts = "--tag ~no_travis"
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts << ' --color'
end

# require 'rcov/rcovtask'
# Rcov::RcovTask.new do |test|
#   test.libs << 'test'
#   test.pattern = 'test/**/test_*.rb'
#   test.verbose = true
#   test.rcov_opts << '--exclude "gems/*"'
# end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sadi-rb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
