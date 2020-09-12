Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  resources :dance, only: [:index, :show, :new, :create] do
    resources :dancer, only: [:create]
  end
  resources :dancer, only: [:destroy]
end
