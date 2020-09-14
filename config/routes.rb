Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :user
  # devise_for :partners
  resource :profile, only: [:edit, :update, :show]

  resources :dances, only: [:index, :show, :new, :create] do
    resource :styles, only: [:edit, :update, :show]
  end

  resources :partners, only: [:index, :show] do
    resources :appointments, only: [:create]

  namespace :partners do
    resources :dances, only: [:index, :show, :new, :create]

    resources :appointments, only: [] do
      member do
        patch :accept
        patch :refuse

  resources :partners, only: [:destroy]
      end
    end
  end
end
end
