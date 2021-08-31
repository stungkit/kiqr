# frozen_string_literal: true

module Kiqr
  module Auth
    module Devise
      extend Dry::Configurable
    end
  end
end

require 'kiqr/auth/engine'
