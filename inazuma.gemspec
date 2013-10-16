# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inazuma/version'

Gem::Specification.new do |spec|
  spec.name          = "inazuma"
  spec.version       = Inazuma::VERSION
  spec.authors       = ["Zachary Friedman"]
  spec.email         = ["zafriedman@gmail.com"]
  spec.description   = %q{Lightweight, ORM and framework agnostic pagination library for Ruby}
  spec.summary       = %q{A simple pagination library for Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 3.2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
