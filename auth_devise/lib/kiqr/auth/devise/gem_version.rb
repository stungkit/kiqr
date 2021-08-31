# frozen_string_literal: true

module Kiqr
  module Auth
    module Devise
      # Returns the version of the currently loaded kiqr_auth_devise as a <tt>Gem::Version</tt>
      def self.gem_version
        Gem::Version.new VERSION::STRING
      end

      module VERSION
        MAJOR = 1
        MINOR = 0
        TINY  = 0
        PRE   = 'alpha'

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
      end
    end
  end
end
