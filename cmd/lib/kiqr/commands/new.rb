# frozen_string_literal: true

module Kiqr
  module Commands
    class NewApplication < Dry::CLI::Command
      desc 'Generate a new Ruby on Rails SaaS application in the specified at the APP_PATH directory'
      argument :app_path, required: true, desc: 'Install directory'
      option :database, default: 'sqlite3', desc: 'Preconfigure for selected database',
                        values: %w[mysql postgresql sqlite3 oracle sqlserver jdbcmysql jdbcsqlite3 jdbcpostgresql jdbc],
                        aliases: ['d', '-d']

      example [
        "~/Code/myapp \n\n  This generates a Rails application with the Kiqr framework in ~/Code/myapp."
      ]

      def call(app_path:, args: [], **options)
        puts `bundle exec rails new #{app_path} --database=#{options[:database]} #{args.join(' ')}`
      end
    end
  end
end
