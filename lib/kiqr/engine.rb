module Kiqr
  class Engine < ::Rails::Engine
    engine_name 'kiqr'

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
