Rails.application.routes.draw do
  root 'events#index'
  
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, except: [:show]
  end

  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :categories, only: [:show]
end
