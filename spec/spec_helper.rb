# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require 'devise'
require 'devise/version'

require 'rails_app/config/environment'

require 'kiqr'
require 'rspec/rails'
require 'shoulda'

RSpec.configure do |config|
  config.order = :random
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)

migrate_path = File.expand_path('rails_app/db/migrate/', __dir__)
if Rails.version.start_with? '6'
  ActiveRecord::MigrationContext.new(migrate_path, ActiveRecord::SchemaMigration).migrate
elsif Rails.version.start_with? '5.2'
  ActiveRecord::MigrationContext.new(migrate_path).migrate
else
  ActiveRecord::Migrator.migrate(migrate_path)
end

# Webrat.configure do |config|
#   config.mode = :rails
#   config.open_error_files = false
# end
