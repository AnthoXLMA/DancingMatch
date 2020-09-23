Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  devise_for :users
  # devise_for :partners

  resource :profile, only: [:edit, :update, :show, :new] do
    resources :dances, only: [:index, :new, :create, :update]
  end

  resources :dances, only: [:index, :new, :create, :show, :update] do
    resources :partners, only: [:index, :new, :show, :create]
  end

  resources :partners, only: [:index, :show] do
    resources :dances, only: [:index, :show]
  end


  namespace :partners do
    resources :dances, only: [:index, :show]
    resources :appointments, only: [:index, :show]
  end

  # namespace :dances do
  #   resources :partners, only: [:index, :show]
  # end

  #   resources :appointments, only: [] do
  #     member do
  #       patch :accept
  #       patch :refuse
  #       end
  #     end
  end
