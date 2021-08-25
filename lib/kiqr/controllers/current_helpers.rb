module Kiqr
  module Controllers
    module CurrentHelpers
      extend ActiveSupport::Concern

      included do
        helper_method :current_account,
                      :current_member,
                      :member_of_account?
      end

      def current_account
        Current.account
      end

      def member_of_account?
        current_member.present?
      end

      def current_member
        return unless user_signed_in?

        current_account.members.find_by(user: current_user)
      end
    end
  end
end
