# frozen_string_literal: true

version = File.read(File.expand_path('KIQR_VERSION', __dir__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'kiqr'
  s.version     = version
  s.summary     = 'Command line tool for Kiqr'
  s.description = 's.summary'

  s.required_ruby_version = '>= 2.6'

  s.license     = 'MIT'

  s.authors     = ['Rasmus Kjellberg']
  s.email       = 'hello@wkoperations.com'
  s.homepage    = 'https://kiqr.dev'

  s.files       = Dir['README.md', 'bin/**/*', 'lib/**/*']

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/kiqr/kiqr/issues',
    'documentation_uri' => 'https://docs.kiqr.dev/',
    'source_code_uri' => 'https://github.com/kiqr/kiqr'
  }

  s.bindir        = 'bin'
  s.executables   = 'kiqr'

  s.add_dependency 'kiqr_core', s.version
end
