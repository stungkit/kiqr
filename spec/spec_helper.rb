# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require File.expand_path('dummy/config/environment', __dir__)

require 'rspec/rails'
require 'kiqr'

RSpec.configure do |config|
  config.order = :random
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
