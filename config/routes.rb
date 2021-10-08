Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  # delete '/logout', to: 'sessions#destroy'

  root to: 'pages#home'

  resources :users, :has_many => :profiles do
    resources :profiles
  end
  resource :users, only: [:create, :new, :destroy, :edit] do
    resources :profiles, only: [:show, :edit]
  end

  resource :profile, only: [:show, :edit, :destroy] do
    resource :profile, only: [:show]
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

  resources :dances, only: [:index] do
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
