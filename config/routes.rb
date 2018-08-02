Rails.application.routes.draw do
  root to: 'home#index'
  resource :accounts, only: %i(show)
  resources :transfers, only: %i(create)
end
