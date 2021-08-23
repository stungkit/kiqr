module Kiqr
  class Engine < ::Rails::Engine
    engine_name 'kiqr'

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end

    initializer 'kiqr.autoload' do |app|
      # Make Kiqr controller helpers available in all app controllers.
      ActionController::Base.include(Kiqr::Controllers::SetCurrentRequestDetails)
      ActionController::Base.include(Kiqr::Controllers::CurrentHelpers)
    end
  end
end
