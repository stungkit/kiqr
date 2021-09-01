# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require_relative 'lib/kiqr/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr'
  s.version     = Kiqr.version
  s.authors     = ['Rasmus Kjellberg', 'WK Operations']
  s.email       = 'hello@wkoperations.com'
  s.summary     = 'Command line tool for Kiqr'
  s.description = s.summary
  s.homepage    = 'https://kiqr.dev'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(%r{^spec/fixtures}) }
  s.bindir        = 'bin'
  s.executables   = 'kiqr'
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.6'
  s.required_rubygems_version = '>= 1.8.23'

  s.add_dependency 'dry-cli', '~> 0.7.0'
end
