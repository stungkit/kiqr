# frozen_string_literal: true

require_relative 'lib/kiqr/version'

Gem::Specification.new do |s|
  s.name        = 'kiqr'
  s.version     = Kiqr::VERSION
  s.authors     = ['kjellberg']
  s.email       = ['rk@youngmedia.se']
  s.homepage    = 'https://kiqr.dev'
  s.summary     = 'An open-source framework for creating SaaS applications with Ruby on Rails'
  s.description = 'An open-source framework for creating SaaS applications with Ruby on Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'cancancan'
  s.add_dependency 'dry-configurable'
  s.add_dependency 'simple_form'
  s.add_dependency 'valid_email2'
end
