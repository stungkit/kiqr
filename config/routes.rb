Rails.application.routes.draw do
  scope module: 'kiqr' do
    resources :accounts do
      get 'switch', to: 'accounts#switch'
    end
  end
end
