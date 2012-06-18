# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "formicary/version"

Gem::Specification.new do |s|
  s.name        = "formicary"
  s.version     = Formicary::VERSION
  s.authors     = ["Romain Binaux"]
  s.email       = ["romain@secondbureau.com"]
  s.homepage    = "http://secondbureau.com/projects/formicary"
  s.summary     = 'organizational chart'
  s.description = 'Formicary is an organizational chart which provides easy way to create and modify orgchart on the fly.'

  s.rubyforge_project = "formicary"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency 'jquery-ui-rails'
  
end
