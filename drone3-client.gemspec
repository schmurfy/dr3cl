# -*- encoding: utf-8 -*-
require File.expand_path('../lib/drone3/client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julien Ammous"]
  gem.email         = ["schmurfy@gmail.com"]
  gem.description   = %q{..}
  gem.summary       = %q{...}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.name          = "drone3-client"
  gem.license       = 'MIT'
  gem.require_paths = ["lib"]
  gem.version       = Drone3::Client::VERSION
  
  gem.add_dependency 'monitoring_protocols'
  gem.add_dependency 'eventmachine',  '>= 1.0.3'

end
