# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in kiqr.gemspec.
gemspec

gem 'rails', '~> 6.1.0'
gem 'rails-controller-testing', github: 'rails/rails-controller-testing'

group :development, :test do
  gem 'devise', '~> 4.8'
  gem 'factory_bot_rails', '~> 6.0'
  gem 'faker', github: 'faker-ruby/faker'
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
