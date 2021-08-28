module Kiqr
  class Ability
    include ::CanCan::Ability

    def initialize(subscription)
      @subscription = subscription
    end

    def self.role_name
      'Member'
    end
  end
end
