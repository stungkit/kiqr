require 'kiqr/version'
require 'kiqr/engine'

module Kiqr
  module Controllers
    autoload :SetCurrentRequestDetails, 'kiqr/controllers/set_current_request_details'
    autoload :CurrentHelpers, 'kiqr/controllers/current_helpers'
    autoload :FrontendHelpers, 'kiqr/controllers/frontend_helpers'
  end

  module Models
    autoload :User, 'kiqr/models/user'
    autoload :Account, 'kiqr/models/account'
    autoload :Member, 'kiqr/models/member'
  end

  # The parent controller all Kiqr controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'

  # Default way to set up Kiqr. Run rails generate kiqr:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
