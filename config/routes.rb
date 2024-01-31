Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :services, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[create update] do
      member do
        patch :accept
        patch :reject
      end
    end# Changed from :reservations to :bookings
  end

  get "dashboard", to: "bookings#index"
  get '/bookings/new', to: 'bookings#new', as: 'new_booking'  # Changed from 'reservations' to 'bookings'
end
