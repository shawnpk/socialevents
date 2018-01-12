Rails.application.routes.draw do
  root 'events#index'

  namespace :admin do
    root 'application#index'
    resources :users,       only: [:index]
    resources :categories,  except: [:show]
  end

  devise_for  :users
  resources   :users,       only: [:show]
  resources   :categories,  only: [:show]

  resources   :events do
    resources   :comments,    only: [:create]
    resources   :attendances, only: [:create]
  end
end
