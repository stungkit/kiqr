# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in kiqr.gemspec.
gemspec

gem 'rails', '~> 6.1.0'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda', '~> 4.0'
end

platforms :ruby do
  gem 'sqlite3', '~> 1.4'
end
