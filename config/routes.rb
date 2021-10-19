Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # devise_scope :user do
  #   delete '/logout' => 'sessions#destroy'
  # end

  # delete '/logout' => 'sessions#destroy'
  # get '/logout' => 'sessions#destroy'
  # resources :sessions

  root to: 'pages#home'

  resources :users do
    resources :profiles
  end
  resource :users, only: [:create, :new, :destroy, :show, :edit, :update] do
    resources :profiles, only: [:show, :edit, :update]
  end

  resources :users, only: [ :index, :show ] do
    resources :reviews, only: [:index, :create, :new, :destroy]
  end

  resources :reviews, only: [ :index, :show ] do
    resources :profiles, only: [:index, :update, :destroy]
  end

  resources :profiles, only: [:index, :edit, :update, :show, :create, :destroy] do
    resources :users, only: [:index, :create, :show, :new, :edit]
  end

  resources :profiles, only: [:index, :edit, :update, :show, :create, :destroy] do
    resources :dances, only: [:index, :create, :show, :new, :edit]
  end

  resources :dances, only: [:index, :show, :new, :create] do
    resources :users, only: [:show]
  end

  resources :users, only: [:index, :show, :new, :create, :update] do
    resources :dances
  end

  resources :requests, only: [:index] do
      member do
        patch :accept
        patch :refuse
      end
    end

  resources :profiles, only: [:index, :edit, :update, :show, :create] do
    resources :appointments, only: [:create, :show, :new]
  end

  resources :appointments, only: [:index, :show, :new, :create] do
    resources :users
  end

  resources :dances, only: [:show] do
    resources :appointments
  end

  resources :dances do
    resource :profiles
  end

  resource :appointments do
    resources :profile
  end
end
