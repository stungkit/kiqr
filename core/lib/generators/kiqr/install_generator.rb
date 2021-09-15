# frozen_string_literal: true

require 'rails/generators/base'
require 'date'

module Kiqr
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Generate migrations, routes and prepare the user model.'

      def check_install_requirements
        return if user_model_exists?

        say 'Kiqr requires a User model to be present before you continue with the install', :red
        say 'Learn more at: https://docs.kiqr.dev/getting-started/existing-project', :red
        exit
      end

      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      def copy_migrations
        # get an array of the migrations in the db/migrate/ folder:
        migrations = Dir[Kiqr::Engine.root.join('db/migrate/*.rb')]
        migrations.each_with_index do |migration, i|
          # Add one second to each migrations timestamp
          seconds = (DateTime.now.strftime('%S').to_i + i).to_s
          seconds = seconds.to_s.length == 2 ? seconds : "0#{seconds}"
          timestamp = (DateTime.now.strftime '%Y%m%d%H%M') + seconds

          # Get the filename from the engine migration minus the timestamp:
          name = migration.split('/').last.split('_')[1..].join('_')

          # Skip already existing migrations.
          if Rails.root.join("db/migrate/*#{name}").exist?
            say "Migration #{name} has already been copied to your app", :green
          else
            copy_file migration, "db/migrate/#{timestamp}_#{name}"
          end
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

      def add_kiqr_routes
        route 'kiqr_routes'
      end

      def inject_user_model_content
        inject_into_class model_path, 'User', user_model_contents
      end

      private

      def user_model_contents
        "  include Kiqr::Models::User\n"
      end

      def user_model_exists?
        File.exist?(model_path)
      end

      def model_path
        @model_path ||= Rails.root.join('app/models/user.rb')
      end
    end
  end
end
