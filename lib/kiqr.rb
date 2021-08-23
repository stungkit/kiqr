require 'kiqr/version'
require 'kiqr/engine'

module Kiqr
  module Controllers
    autoload :SetCurrentRequestDetails, 'kiqr/controllers/set_current_request_details'
  end

  module Models
    autoload :User, 'kiqr/models/user'
    autoload :Account, 'kiqr/models/account'
    autoload :Member, 'kiqr/models/member'
  end
end
