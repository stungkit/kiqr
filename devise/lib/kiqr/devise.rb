# frozen_string_literal: true

require 'devise'

module Kiqr
  module Devise
    extend Dry::Configurable
  end
end

require 'kiqr/devise/engine'
