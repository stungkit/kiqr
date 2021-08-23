Rails.application.routes.draw do
  scope module: 'kiqr' do
    resources :accounts do
      member do
        get :switch
      end
    end

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
