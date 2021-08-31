# frozen_string_literal: true

module Kiqr
  module Controllers
    module ForceAccountSetup
      extend ActiveSupport::Concern

      included do
        before_action :redirect_to_account_setup, unless: :devise_controller?
      end

      def redirect_to_account_setup
        return unless user_signed_in?

        redirect_to setup_account_path if current_account.pending_setup?
      end
    end
  end
end
