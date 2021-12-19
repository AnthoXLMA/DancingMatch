Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'

  resources :users, only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    resources :profiles, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end

   resources :profiles, only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    resources :users, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :reviews, only: [:create, :index]
  end

  resources :users, only: [:index, :new, :create, :show] do
    resources :requests, only: [:index, :new, :create, :show]
  end

  resources :profiles, only: [:index, :edit, :update, :show, :create, :destroy] do
    resources :dances, only: [:index, :create, :show, :new, :edit]
  end

  resources :profiles, only: [:index, :show] do
    resources :meetings, only: [:create, :show]
  end

  resources :dances, only: [:index, :show, :new, :create] do
    resources :users, only: [:show]
  end

  resources :users, only: [:index, :show, :new, :create, :update] do
    resources :dances
  end

  resources :profiles, only: [:index, :new, :create, :show] do
    resources :requests, only: [:index, :new, :create, :show, :destroy]
  end

  resources :profiles, only: [:index, :edit, :update, :show, :create, :destroy] do
    resources :appointments, only: [:create, :show, :new]
  end

  resources :appointments, only: [:index, :show, :new, :create] do
    resources :users
  end

  resources :dances, only: [:show] do
    resources :appointments
  end

  resources :dances do
    resources :profiles, only: [:new, :create, :show, :destroy]
  end

  resource :appointments do
    resources :profile
  end

  resources :requests, only: [:index] do
    member do
      patch :accept
      patch :refuse
    end
  end
end
