# frozen_string_literal: true

def kiqr_run_migrations(migrate_path)
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Base.logger = Logger.new(nil)

  if Rails.version.start_with?('6', '7')
    ActiveRecord::MigrationContext.new(migrate_path, ActiveRecord::SchemaMigration).migrate
  elsif Rails.version.start_with? '5.2'
    ActiveRecord::MigrationContext.new(migrate_path).migrate
  else
    ActiveRecord::Migrator.migrate(migrate_path)
  end
end
