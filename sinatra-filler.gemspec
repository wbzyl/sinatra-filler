# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra/version"

Gem::Specification.new do |s|
  s.name        = "sinatra-filler"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Włodek Bzyl"]
  s.email       = ["matwb@ug.edu.pl"]
  s.homepage    = "http://www.sinatrarb.com/"
  s.summary     = %q{Small Sinatra extension to add several helpers methods}
  s.description = %q{Small Sinatra extension to add several helpers methods: filler_for, stylesheets, javascripts}

  s.rubyforge_project = 'sinatra-filler', '>= 0.0.3'

  s.add_runtime_dependency 'sinatra', '>= 1.1'
  s.add_runtime_dependency 'sinatra-static-assets', '>= 0.5.0'
  s.add_development_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
