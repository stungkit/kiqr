module Kiqr
  module Controllers
    module CurrentHelpers
      extend ActiveSupport::Concern

      included do
        helper_method :current_account, :current_member
      end

      def current_account
        Current.account
      end

      def current_member
        current_account.members.find_by(user: current_user)
      end
    end
  end
end
