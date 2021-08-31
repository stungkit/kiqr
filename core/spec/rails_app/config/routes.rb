Rails.application.routes.draw do
  devise_for :users
  kiqr_routes
end
