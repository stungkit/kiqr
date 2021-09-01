# frozen_string_literal: true

module Kiqr
  module Commands
    class Version < Dry::CLI::Command
      desc 'Show Kiqr version number and quit'

      def call(*)
        version = Kiqr.version
        puts "Kiqr #{version}"
      end
    end
  end
end
