# frozen_string_literal: true

%w[
  actionmailer actionpack actionview activejob activemodel activerecord
  activestorage activesupport railties
].each do |rails_gem|
  gem rails_gem, ENV.fetch('RAILS_VERSION', '~> 6.1.0'), require: false
end

gem 'sqlite3', '~> 1.4'

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'factory_bot_rails', '~> 6.0'
  gem 'faker', '~> 2.19'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda', '~> 4.0'
end
