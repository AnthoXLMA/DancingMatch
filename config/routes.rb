Rails.application.routes.draw do
  # Devise for user authentication
  devise_for :users

  # Root path
  root to: 'pages#home'

  # Users and nested resources
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :profiles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index, :create]
    resources :requests, only: [:index, :new, :create, :show]
    resources :dances, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  # Profiles and nested resources
  resources :profiles, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :users, only: [:index, :show, :edit, :update, :create, :destroy]
    resources :dances, only: [:index, :new, :create, :show, :edit]
    resources :meetings, only: [:create, :show]
    resources :requests, only: [:index, :new, :create, :show, :destroy]
    resources :appointments, only: [:new, :create, :show]
  end

  # Dances and nested resources
  resources :dances, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :users, only: [:show]
    resources :appointments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :profiles, only: [:new, :create, :show, :destroy]
  end

  # Appointments and nested resources
  resources :appointments, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :profiles, only: [:index, :new, :create, :edit, :update, :show, :destroy]
    resources :subscriptions, only: [:new, :create, :destroy]
  end

  # Requests with custom member actions
  resources :requests, only: [:index] do
    member do
      patch :accept
      patch :refuse
    end
  end
end
