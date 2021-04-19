Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resource :profile, only: [:index, :edit, :update, :show, :create] do
    resources :dances, only: [:create, :show, :new]
  end

  resources :dances, only: [:index, :show, :new, :create] do
    resources :users
  end

  resource :profile, only: [:index, :edit, :update, :show, :create] do
    resources :appointments, only: [:create, :show, :new]
  end

  resources :appointments, only: [:index, :show, :new, :create] do
    resources :users
  end
end
