Rails.application.routes.draw do
  resources :flights
  root "flights#index"
  resources :bookings
end
