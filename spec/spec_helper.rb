# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require File.expand_path('dummy/config/environment', __dir__)

require 'rspec/rails'
require 'database_cleaner'

RSpec.configure do |config|
  config.order = :random
  # Clean out the database state before the tests run
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Webrat.configure do |config|
#   config.mode = :rails
#   config.open_error_files = false
# end
