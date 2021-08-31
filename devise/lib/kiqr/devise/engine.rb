# frozen_string_literal: true

module Kiqr
  module Devise
    class Engine < ::Rails::Engine
      engine_name 'kiqr_devise'

      config.generators do |g|
        g.test_framework :rspec
        g.assets false
        g.helper false
      end
    end
  end
end
