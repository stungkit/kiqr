# frozen_string_literal: true

require_relative 'lib/kiqr/core/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr_core'
  s.version     = Kiqr::Core.version
  s.authors     = ['Rasmus Kjellberg', 'WK Operations']
  s.email       = 'hello@wkoperations.com'
  s.summary     = 'Core gem for Kiqr'
  s.description = 'Kiqr Models, Helpers, Services and core libraries'
  s.homepage    = 'https://kiqr.dev'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(%r{^spec/fixtures}) }
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.6'
  s.required_rubygems_version = '>= 1.8.23'

  s.add_dependency 'cancancan', '~> 3.3.0'
  s.add_dependency 'dry-configurable', '~> 0.12.1'
  s.add_dependency 'responders', '~> 3.0.1'
  s.add_dependency 'valid_email2', '~> 4.0.0'
end
