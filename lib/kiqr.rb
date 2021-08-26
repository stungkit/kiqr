require 'kiqr/version'
require 'kiqr/engine'
require 'kiqr/rails/routes'

require 'dry-configurable'

module Kiqr
  extend Dry::Configurable

  module Controllers
    autoload :CurrentHelpers, 'kiqr/controllers/current_helpers'
    autoload :FrontendHelpers, 'kiqr/controllers/frontend_helpers'
    autoload :SetCurrentRequestDetails, 'kiqr/controllers/set_current_request_details'
  end

  module Models
    autoload :Account, 'kiqr/models/account'
    autoload :Member, 'kiqr/models/member'
    autoload :User, 'kiqr/models/user'
  end

  # The parent controller all Kiqr controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  setting :parent_controller, 'ApplicationController'
end
