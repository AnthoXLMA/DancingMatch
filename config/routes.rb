Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'

  resource :profile, only: [:index, :edit, :update, :show, :create, :destroy] do
    resources :dances, only: [:create, :show, :new]
  end

  resources :dances, only: [:index, :show, :new, :create] do
    resources :users
  end

  resources :users, only: [:index, :show, :new, :create] do
    resources :dances
  end

  resources :dances, only: [:index] do
      member do
        patch :accept
        patch :refuse
      end
    end

  resource :profile, only: [:index, :edit, :update, :show, :create] do
    resources :appointments, only: [:create, :show, :new]
  end

  resources :appointments, only: [:index, :show, :new, :create] do
    resources :users
  end

  resources :dances, only: [:show] do
    resources :appointments
  end

  resources :dances do
    resource :profile
  end

  resource :appointments do
    resources :profile
  end

  resource :users, only: [:create, :new, :destroy] do
    resources :profile, only: [:show, :edit]
  end
end
