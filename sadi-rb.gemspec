# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sadi-rb"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Will Strinz"]
  s.date = "2013-10-17"
  s.description = "Build and run SADI services with ruby-rdf and sinatra"
  s.email = "wstrinz@gmail.com"
  s.executables = ["sadi-rb"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "bin/sadi-rb",
    "lib/sadi-rb.rb",
    "lib/sadi-rb/asynchronous_service.rb",
    "lib/sadi-rb/base_service.rb",
    "lib/sadi-rb/converter.rb",
    "lib/sadi-rb/example_service.rb",
    "lib/sadi-rb/example_service_async.rb",
    "lib/sadi-rb/server.rb",
    "lib/sadi-rb/services.rb",
    "lib/sadi-rb/synchronous_service.rb",
    "sadi-rb.gemspec",
    "spec/server_spec.rb"
  ]
  s.homepage = "http://github.com/wstrinz/sadi-rb"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Build and run SADI services with ruby-rdf and sinatra"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra-linkeddata>, [">= 0"])
      s.add_runtime_dependency(%q<equivalent-xml>, [">= 0"])
      s.add_runtime_dependency(%q<thin>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<sinatra-linkeddata>, [">= 0"])
      s.add_dependency(%q<equivalent-xml>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<sinatra-linkeddata>, [">= 0"])
    s.add_dependency(%q<equivalent-xml>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end

