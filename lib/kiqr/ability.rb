module Kiqr
  class Ability
    include ::CanCan::Ability

    class << self
      def role_name
        'member'
      end
    end
  end
end
