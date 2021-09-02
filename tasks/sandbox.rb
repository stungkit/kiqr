# frozen_string_literal: true

desc 'Install a temporary sandbox environment at ./sandbox/'
task :sandbox do
  min_rails_version = '5.2.0'

  sandbox_flags = [
    '--skip-git',
    '--skip-keeps',
    '--skip-test',
    '--skip-javascript'
  ]

  # Check that a supported Rails version is installed globally.
  rails_version = `rails -v`.gsub('Rails ', '')
  rails_version = Gem::Version.new(rails_version)

  # This condition will also be true if Rails is not installed.
  if rails_version < Gem::Version.new(min_rails_version)
    puts 'Please update your Rails version to 5.2.0 or higher!'
    exit
  end

  root = File.expand_path('..', __dir__)
  sandbox_directory = "#{root}/sandbox"

  # Empty sandbox directory
  rm_rf sandbox_directory

  template_directory = File.expand_path('../lib/generators/templates', __dir__)
  template_file = File.join(template_directory, 'sandbox.rb')
  sandbox_flags << "-m #{template_file}"

  # Run Kiqr installer
  sh "rails new #{sandbox_directory} #{sandbox_flags.join(' ')}"
end
