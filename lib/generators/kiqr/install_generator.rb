# frozen_string_literal: true

require 'rails/generators/active_record'
require 'generators/kiqr/orm_helpers'

module Kiqr
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      include Rails::Generators::ResourceHelpers
      include Kiqr::Generators::OrmHelpers

      source_root File.expand_path('../../templates/migrations', __FILE__)

      desc 'Generate migrations and prepare the user model.'

      def copy_migrations
        unless model_exists?
          say "Couldn't find model #{class_name}"
          say 'Please install and configure Devise first.'
          return
        end

        migration_template 'accounts.rb', "#{migration_path}/create_accounts.rb"
        migration_template 'members.rb', "#{migration_path}/create_members.rb"
        migration_template 'add_account_id_to_users.rb', "#{migration_path}/add_account_id_to_#{table_name}.rb"
      end

      def inject_user_model_content
        return unless model_exists?

        content = model_contents
        class_path = (namespaced? ? class_name.to_s.split('::') : [class_name])
        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| '  ' * indent_depth + line }.join("\n") << "\n"
        inject_into_class(model_path, class_path.last, content)
      end

      private

      def model_contents
        '  include Kiqr::Models::User'
      end
    end
  end
end
