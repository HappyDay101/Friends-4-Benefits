Rails.application.routes.draw do
  devise_for :users
  root to: "services#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :services, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:create]  # Changed from :reservations to :bookings
  end

  get '/bookings/new', to: 'bookings#new', as: 'new_booking'  # Changed from 'reservations' to 'bookings'
end
