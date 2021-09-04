# frozen_string_literal: true

require 'cancan'
require 'dry-configurable'
require 'responders'
require 'valid_email2'

module Kiqr
  extend Dry::Configurable

  module Controllers
    autoload :Helpers, 'kiqr/core/controllers/helpers'
    autoload :CurrentHelpers, 'kiqr/core/controllers/current_helpers'
    autoload :FrontendHelpers, 'kiqr/core/controllers/frontend_helpers'
    autoload :SetCurrentRequestDetails, 'kiqr/core/controllers/set_current_request_details'
    autoload :ForceAccountSetup, 'kiqr/core/controllers/force_account_setup'
  end

  module Models
    autoload :Account, 'kiqr/core/models/account'
    autoload :Member, 'kiqr/core/models/member'
    autoload :User, 'kiqr/core/models/user'
  end

  autoload :Current, 'kiqr/core/current'

  # The parent controller all Kiqr controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  setting :parent_controller, 'ApplicationController'

  # Specify settings for email validations. Available options can
  # be found in the documentation for 'valid_email2' gem at:
  # https://github.com/micke/valid_email2
  setting :email_validations, { mx: true }

  # Which formats should be treated as navigational. Navigational formats
  # like :html & :turbo_stream should redirect and show flash messages,
  # but other formats like :xml or :json, should return 401. The "*/*"
  # format below is required to match Internet Explorer.
  setting :navigational_formats, ['*/*', :html, :turbo_stream]
end

require 'kiqr/core/engine'
require 'kiqr/core/rails/routes'
