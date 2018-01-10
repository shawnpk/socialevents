Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, except: [:show]
  end

  root 'events#index'
  devise_for :users
  resources :users, only: [:show]
  resources :events
end
