Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  devise_for :users
  # devise_for :partners

  resource :profile, only: [:index, :edit, :update, :show, :create] do
    resources :dances, only: [:create, :show, :new]
  end

  resources :dances, only: [:index, :show, :create, :update, :new]do
    resources :users
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
