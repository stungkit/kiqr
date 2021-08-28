module Kiqr
  module Controllers
    module SetCurrentRequestDetails
      extend ActiveSupport::Concern

      included do
        before_action :set_current_request_details
      end

      def set_current_request_details
        Kiqr::Current.user_agent = request.user_agent
        Kiqr::Current.ip_address = request.ip
        Kiqr::Current.user ||= current_user

        # Account may already be set by the AccountMiddleware
        Kiqr::Current.account ||= account_from_session || fallback_account
      end

      def account_from_session
        return unless user_signed_in? && session[:account_id].present?

        current_user.accounts.find_by(id: session[:account_id])
      end

      def fallback_account
        return unless user_signed_in?

        current_user.account || current_user.create_default_account
      end
    end
  end
end
