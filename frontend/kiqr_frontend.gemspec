# frozen_string_literal: true

require_relative 'lib/kiqr/frontend/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr_frontend'
  s.version     = Kiqr::Frontend.version
  s.authors     = 'Rasmus Kjellberg'
  s.email       = 'hello@wkoperations.com'
  s.summary     = 'Example views and layout for Kiqr'
  s.description = 'Kiqr views and layout in TailwindCSS for the starter kit generated by the kiqr command line tool'
  s.homepage    = 'https://kiqr.dev'
  s.license     = 'MIT'

  s.files        = Dir['{app,lib,config}/**/*', 'Rakefile']
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.6'
  s.required_rubygems_version = '>= 1.8.23'

  s.add_dependency 'heroicon'
  s.add_dependency 'simple_form', '~> 5.1.0'
end
