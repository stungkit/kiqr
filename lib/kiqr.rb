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

  # Constants which holds kiqr configuration for extensions. Those should
  # not be modified by the "end user" (this is why they are constants).
  ALL_MODULES = []
  USER_MODULES = []

  def self.add_module(module_name, options = {})
    insert_at = (options[:insert_at] || -1)
    ALL_MODULES.insert insert_at, module_name

    raise "Missing route parameter for module #{module_name}" unless (route = options[:route])

    USER_MODULES.insert insert_at, {
      label: (options[:label] || module_name.capitalize),
      route: route,
      display_at: (options[:display_at] || nil)
    }
  end
end
