require 'kiqr/version'
require 'kiqr/engine'

module Kiqr
  module Models
    autoload :User, 'kiqr/models/user'
    autoload :Account, 'kiqr/models/account'
    autoload :Member, 'kiqr/models/member'
  end
end
