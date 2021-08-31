# frozen_string_literal: true

require_relative 'lib/kiqr/devise/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr_devise'
  s.version     = Kiqr::Devise.version
  s.authors     = ['Rasmus Kjellberg', 'WK Operations']
  s.email       = 'hello@wkoperations.com'
  s.summary     = 'Devise authentication for Kiqr'
  s.description = 'Generates and configures Devise with a User model for Kiqr'
  s.homepage    = 'https://kiqr.dev'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(%r{^spec/fixtures}) }
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.6'
  s.required_rubygems_version = '>= 1.8.23'

  s.add_dependency 'devise', '~> 4.7'
  s.add_dependency 'dry-configurable'
  s.add_dependency 'kiqr_core', s.version
end
