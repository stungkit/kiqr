# frozen_string_literal: true

require_relative 'gem_version'

module Kiqr
  module Core
    # Returns the version of the currently loaded kiqr_core as a <tt>Gem::Version</tt>
    def self.version
      gem_version
    end
  end
end
