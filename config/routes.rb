Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  root 'events#index'
  devise_for :users
  resources :users, only: [:show]
  resources :events
end
