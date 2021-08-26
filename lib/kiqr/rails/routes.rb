# frozen_string_literal: true

module ActionDispatch
  module Routing
    class Mapper
      def kiqr_routes(options = {})
        options[:path_names] ||= {}
        options[:path_names][:accounts] ||= 'accounts'
        path_names = options[:path_names]

        scope module: 'kiqr' do
          resources :accounts, path: path_names[:accounts] do
            member do
              match :switch, via: %i[get patch]
            end
          end

          # get 'settings', to: 'settings#edit'
          # patch 'settings', to: 'settings#update'

          # account/:id/settings
          # account/:id/members
          # account/:id/members/invite
          # account/:id/members/invite/:id
          # account/:id/members/:id
          # billing
          # billing/subscription/cancel
          # billing/change-plan
          # billing/change-plan/:id
          # billing/receipts
          # billing/select-plan
          # billing/select-plan/pending
          # pay/webhooks/braintree
          # pay/webhooks/paddle
          # pay/webhooks/stripe
        end
      end
    end
  end
end
