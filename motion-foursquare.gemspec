# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-foursquare/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "motion-foursquare"
  s.version         = "0.1.0"
  gem.authors       = ["Vaughan Kelly Guy"]
  gem.email         = ["vkellyguy@gmail.com"]
  gem.description   = "Foursquare API wrapper for rubymotion"
  gem.summary       = ""
  gem.homepage      = "https://github.com/vaughankg/motion-foursquare"
  gem.license       = "MIT"

  gem.version       = Foursquare::VERSION

  gem.add_dependency("afmotion")
  gem.add_development_dependency("rake")
end

