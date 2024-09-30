Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :cars
  get 'costly_cars', to: 'cars#costly_cars'
end
