# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'breachalarm/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_dependency 'sawyer', '>= 0.5.3', '~> 0.6.0'
  spec.authors = ["Michael Pellon"]
  spec.description = %q{Simple wrapper for the BreachAlarm API}
  spec.email = ['m@pellon.io']
  spec.files = %w(.document CONTRIBUTING.md LICENSE.md README.md Rakefile breachalarm.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.homepage = 'https://github.com/mpellon/breachalarm.rb'
  spec.licenses = ['MIT']
  spec.name = 'breachalarm'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = "Ruby toolkit for working with the BreachAlarm API"
  spec.version = BreachAlarm::VERSION.dup
end
