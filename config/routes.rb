Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :dances, only: [:index, :show, :new, :create] do
    resources :dancers, only: [:create]
  end
  resources :dancers, only: [:destroy]
end
