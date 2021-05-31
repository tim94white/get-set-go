Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]

  resources :furnishings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
