# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require 'rails_app/config/environment'

require 'rspec/rails'

require 'kiqr/testing_support/factories'
require 'kiqr/testing_support/shoulda'
require 'kiqr/testing_support/migrations'

kiqr_run_migrations(File.expand_path('rails_app/db/migrate/', __dir__))
