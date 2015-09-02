# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-foursquare/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "motion-foursquare"
  gem.version       = "0.1.0"
  gem.authors       = ["Vaughan Kelly Guy"]
  gem.email         = ["vkellyguy@gmail.com"]
  gem.summary       = "Foursquare API wrapper for rubymotion"
  gem.description   = "A WIP wrapper around the Foursquare v2 API using AFNetworking"
  gem.homepage      = "https://github.com/vaughankg/motion-foursquare"
  gem.license       = "MIT"

  gem.version       = Foursquare::VERSION

  files = []
  files.concat(Dir.glob('lib/**/*.rb'))
  files.concat(Dir.glob('templates/**/*.rb'))
  gem.files = files

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency("afmotion", "~>2.5")
  gem.add_runtime_dependency "motion-cocoapods"
  gem.add_development_dependency("rake", "~>0")
  gem.add_development_dependency("motion-fixtures", "~>0.1.0")
  gem.add_development_dependency("webstub", "~>1.1.3")
end

