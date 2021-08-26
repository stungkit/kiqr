module Kiqr
  class Engine < ::Rails::Engine
    engine_name 'kiqr'

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end

    initializer 'kiqr.setup' do
      # Make Kiqr controller helpers available in all app controllers.
      ActionController::Base.include(Kiqr::Controllers::SetCurrentRequestDetails)
      ActionController::Base.include(Kiqr::Controllers::CurrentHelpers)
      ActionController::Base.include(Kiqr::Controllers::ForceAccountSetup)
    end
  end
end
