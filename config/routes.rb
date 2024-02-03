Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :services, only: %i[index show new create edit update destroy] do
    resources :bookings, only: [:create]
    resources :reviews
  end

  # Singular route for creating a new booking outside of the service scope
  get '/bookings/new', to: 'bookings#new', as: 'new_booking'

  # Singular route for updating a booking
  resources :bookings, only: [:update]

  # Route for the dashboard which likely shows user services and bookings
  get "dashboard", to: "bookings#index"
end
