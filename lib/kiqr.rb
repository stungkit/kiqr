require 'kiqr/version'
require 'kiqr/engine'
require 'kiqr/rails/routes'

require 'cancan'
require 'dry-configurable'
require 'simple_form'
require 'valid_email2'

module Kiqr
  extend Dry::Configurable

  module Controllers
    autoload :CurrentHelpers, 'kiqr/controllers/current_helpers'
    autoload :FrontendHelpers, 'kiqr/controllers/frontend_helpers'
    autoload :SetCurrentRequestDetails, 'kiqr/controllers/set_current_request_details'
    autoload :ForceAccountSetup, 'kiqr/controllers/force_account_setup'
  end

  module Models
    autoload :Account, 'kiqr/models/account'
    autoload :Member, 'kiqr/models/member'
    autoload :User, 'kiqr/models/user'
  end

  autoload :Ability, 'kiqr/ability'

  # The parent controller all Kiqr controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  setting :parent_controller, 'ApplicationController'

  # Specify settings for email validations. Available options can
  # be found in the documentation for 'valid_email2' gem at:
  # https://github.com/micke/valid_email2
  setting :email_validations, { mx: true }
end
