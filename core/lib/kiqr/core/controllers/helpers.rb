# frozen_string_literal: true

module Kiqr
  module Controllers
    # Those helpers are convenience methods added to ApplicationController.
    module Helpers
      extend ActiveSupport::Concern

      included do
        if respond_to?(:helper_method)
          helpers = %w[account_signed_in? authenticate_account! current_account current_member current_subscription_plan member_of_account?]
          helper_method(*helpers)
        end
      end

      # Returns true if current_account is set to an account.
      def account_signed_in?
        !current_account.nil?
      end

      # Method used by accounts controller to redirect the user after an account
      # has been setup and validated. You can overwrite it in your ApplicationController
      # to provide a custom url.
      def after_account_setup_path
        root_path
      end

      # Method used by accounts controller to redirect the user after a user
      # has switched to another account. You can overwrite it in your
      # ApplicationController to provide a custom url.
      def after_account_switched_path
        root_path
      end

      # Method used by accounts controller to redirect the user after an
      # account has been updated. You can overwrite it in your
      # ApplicationController to provide a custom url. Default is to stay
      # on the edit page.
      def after_account_updated_path
        edit_account_path
      end

      # Redirects unless current_user has an account.
      def authenticate_account!
        # First we need to make sure that a user is signed in
        # by calling Devise authenticate_user! method.
        authenticate_user!

        # Check if an account is signed in, but not if we're 
        # on a DeviseController (user signup/registration etc)
        return if account_signed_in? || devise_controller?

        redirect_to new_account_path, notice: I18n.t('kiqr.misc.account_setup_required')
      end

      # Override cancancan's default current_ability to authorize
      # actions depending on the current_member role and subscription plan.
      # You can overwrite it in your ApplicationController if you
      # want to build a custom authorization strategy.
      def current_ability
        @current_ability ||= Ability.new(current_member, current_subscription_plan)
      end

      # Current signed-in account. You can overwrite this by setting
      # the global variable @current_account to another Account in a
      # controller. However, It's not recommended to overwrite current_account,
      # but we'll leave the opportunity here in case you'll have to.
      def current_account
        @current_account || Kiqr::Current.account
      end

      # Current signed-in member (user-to-account association). Can be
      # used to validate that a user is a member of the current_account
      # or for example to get the current member role with current_member.role?('admin')
      def current_member
        return unless user_signed_in?

        current_account.members.find_by(user: current_user)
      end

      # Return the current_account's current subscription plan. This
      # is currently a placeholder method, until a good subscription
      # strategy has been developed. It's added temporary so that we
      # can build generators for cancancan's Ability staretegies.
      def current_subscription_plan
        return unless user_signed_in? && current_account.present?
      end

      # Return true/false depending on if the current_user is a
      # member of the current_account
      def member_of_account?
        current_member.present?
      end

      # Check if flash messages should be emitted. Default is to do it on
      # navigational formats
      def flashing_format?
        request.respond_to?(:flash) && navigational_format?
      end

      # Check if current request format is navigational. Formats like
      # :html & :turbo_stream should redirect and show flash messages,
      # but formats like :xml or :json, should return 401
      def navigational_format?
        Kiqr.config.navigational_formats.include?(request_format)
      end
    end
  end
end
