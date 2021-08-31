# frozen_string_literal: true

require_relative 'core/lib/kiqr/core/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr'
  s.version     = Kiqr.version
  s.authors     = ['Rasmus Kjellberg', 'WK Operations']
  s.email       = 'hello@wkoperations.com'
  s.summary     = 'SaaS applications with Ruby on Rails'
  s.description = 'An open source framework for creatin g SaaS applications with Ruby on Rails'
  s.homepage    = 'https://kiqr.dev'
  s.license     = 'MIT'

  s.files        = Dir['README.md']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.required_ruby_version = '>= 2.6'

  s.add_dependency 'kiqr_core', s.version
end
