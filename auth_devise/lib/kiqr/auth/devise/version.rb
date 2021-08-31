# frozen_string_literal: true

require_relative 'gem_version'

module Kiqr
  module Auth
    module Devise
      # Returns the version of the currently loaded kiqr_auth_devise as a <tt>Gem::Version</tt>
      def self.version
        gem_version
      end
    end
  end
end
