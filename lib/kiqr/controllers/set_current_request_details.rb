module Kiqr
  module Controllers
    module SetCurrentRequestDetails
      extend ActiveSupport::Concern

      included do
        before_action :set_current_request_details
      end

      def set_current_request_details
        Current.user_agent = request.user_agent
        Current.ip_address = request.ip
        Current.user ||= current_user
        Current.account ||= fetch_account_from_current_user
      end

      def fetch_account_from_current_user
        return unless user_signed_in?

        Current.user.account || fallback_account
      end

      def fallback_account
        return unless user_signed_in?

        current_user.accounts.order(created_at: :desc).first || current_user.create_default_account
      end
    end
  end
end
