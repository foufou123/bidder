Rails.application.routes.draw do
  resources :portfolios
  resources :contractors
  resources :contracts
  resources :bids
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :jobs
  root 'jobs#index'
end
