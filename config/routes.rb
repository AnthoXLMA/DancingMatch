Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  # devise_for :users
  # devise_for :partners


  resource :profile, only: [:edit, :update, :show]

  resources :dances, only: [:index, :show] do
    resources :appointments, only: [:create]

  resources :dances, only: [:index, :show, :new, :create] do
    resource :dancers, only: [:edit, :update, :show]

  end

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
