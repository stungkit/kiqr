# frozen_string_literal: true

module Kiqr
  module Commands
    class Version < Dry::CLI::Command
      desc 'Show Kiqr version number and quit'

      def call(*)
        version = Kiqr::CLI.version
        puts "Kiqr #{version}"
      end
    end
  end
end
