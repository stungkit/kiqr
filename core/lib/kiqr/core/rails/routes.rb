# frozen_string_literal: true

module ActionDispatch
  module Routing
    class Mapper
      def kiqr_routes(options = {})
        options[:path] ||= 'account'

        kiqr_scope(options) do
          kiqr_accounts(options)
          kiqr_members(options)
          kiqr_account_switcher(options)
        end
      end

      protected

      def kiqr_scope(options, &block)
        scope options[:path], module: 'kiqr', &block
      end

      def kiqr_accounts(_options)
        resource :account, only: %i[new create edit update], path: '' do
          get :setup, as: :setup
        end
      end

      def kiqr_account_switcher(_options)
        match 'switch/:id', via: %i[get patch], to: 'accounts#switch', as: :switch_account
      end

      def kiqr_members(_options)
        resources :members, only: :index
      end
    end
  end
end
