# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sssmoke/version'

Gem::Specification.new do |gem|
  gem.name          = 'sssmoke'
  gem.version       = Sssmoke::VERSION
  gem.authors       = ['Paolo "Nusco" Perrotta']
  gem.email         = ['paolo.nusco.perrotta@gmail.com']
  gem.description   = 'Slap Ruby scripts on a web server in seconds.'
  gem.summary       = 'Put erb templates in a folder and run them in a server with the "sssmoke" command.'
  gem.homepage      = 'https://github.com/nusco/sssmoke'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rake', '>= 10.0.0'
  gem.add_development_dependency 'rack-test', '>= 0.6.2'
  gem.add_dependency 'sinatra', '>= 1.3.5'
end
