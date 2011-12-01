lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler'

Gem::Specification.new do |s|
  s.name        = "snowday"
  s.version     = '0.1.3'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Pack"]
  s.email       = ["mikepackdev@gmail.com"]
  s.homepage    = "http://www.mikepackdev.com"
  s.summary     = %q{Snowday Formatter for RSpec}
  s.description = %q{Makes you feel all warm inside. Like hot chocolate.}

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency 'rspec'

  s.files = %w( README.md snowday.gemspec ) + Dir["lib/**/*.rb"]
  s.test_files = Dir["spec/**/*.rb"]
  s.require_paths = ["lib"]
end
