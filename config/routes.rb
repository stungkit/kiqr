Rails.application.routes.draw do
  resources :accounts do
    get 'switch', to: 'accounts#switch'
  end
end
