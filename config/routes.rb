Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'application#index'
    resources :users,       only: [:index]
    resources :categories,  except: [:show]
    resources :comments,    only: [:index]
    resources :attendances, only: [:index]
  end

  devise_for  :users
  resources   :users,       only: [:show]
  resources   :categories,  only: [:show]
  resources   :tags,        only: [:show]

  resources   :events do
    resources   :comments,    only: [:create]
    resources   :attendances, only: [:create]
    resources   :likes,       only: [:create]
  end
end
