Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  devise_for :user
  # devise_for :partners

  resource :profile, only: [:edit, :update, :show]

  resources :dances, only: [:index, :show, :new, :create]

  resources :partners, only: [:index, :show]

  # resources :partners, only: [:index, :show] do
  #   resources :appointments, only: [:show]
  # end

  namespace :partners do
    resources :dances, only: [:index, :show]
  end

  namespace :dances do
    resources :partners, only: [:index, :show]
  end

    resources :appointments, only: [] do
      member do
        patch :accept
        patch :refuse
        end
      end
    end
