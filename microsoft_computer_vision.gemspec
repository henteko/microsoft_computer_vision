# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'microsoft_computer_vision/version'

Gem::Specification.new do |spec|
  spec.name          = 'microsoft_computer_vision'
  spec.version       = MicrosoftComputerVision::VERSION
  spec.authors       = ['henteko']
  spec.email         = ['henteko07@gmail.com']

  spec.summary       = 'This is a very basic wrapper for the Microsoft Computer Vision API.'
  spec.description   = 'This is a very basic wrapper for the Microsoft Computer Vision API.'
  spec.homepage      = 'https://github.com/henteko/microsoft_computer_vision'

  spec.files         = `git ls-files`.split($/).reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
