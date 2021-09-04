# frozen_string_literal: true

module Kiqr
  module Frontend
    # Returns the version of the currently loaded kiqr_core as a <tt>Gem::Version</tt>
    def self.gem_version
      Gem::Version.new VERSION::STRING
    end

    module VERSION
      MAJOR = 0
      MINOR = 0
      TINY  = 2
      PRE   = nil

      STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
    end
  end
end
