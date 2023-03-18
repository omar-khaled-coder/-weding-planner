Rails.application.routes.draw do
  resources :listings
  resources :bookings
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "listings#index"
  get "about", to: "pages#about"

  resources :bookings, only: [:create, :show, :update]

  resources :listings, only: [:create, :show, :update]

end
