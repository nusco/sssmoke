# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sssmoke/version'

Gem::Specification.new do |gem|
  gem.name          = "sssmoke"
  gem.version       = Sssmoke::VERSION
  gem.authors       = ["Paolo \"Nusco\" Perrotta"]
  gem.email         = ["paolo.nusco.perrotta@gmail.com"]
  gem.description   = %q{Slap Ruby scripts on a web server in seconds.}
  gem.summary       = %q{Put erb templates in a folder and run them in a server with the 'sssmoke' command.}
  gem.homepage      = "https://github.com/nusco/sssmoke"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack-test'
  gem.add_dependency 'sinatra'
end
