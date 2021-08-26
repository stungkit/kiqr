# frozen_string_literal: true

require_relative 'lib/kiqr/version'

Gem::Specification.new do |spec|
  spec.name        = 'kiqr'
  spec.version     = Kiqr::VERSION
  spec.authors     = ['kjellberg']
  spec.email       = ['rk@youngmedia.se']
  spec.homepage    = 'https://kiqr.dev'
  spec.summary     = 'An open-source framework for creating SaaS applications with Ruby on Rails'
  spec.description = 'An open-source framework for creating SaaS applications with Ruby on Rails'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.test_files = Dir['spec/**/*']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'rails', '~> 6.1.4'
  spec.add_dependency 'valid_email2'

  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rails'
end
