Rails.application.routes.draw do
  root "home#index"
  resources :cars
  get 'costly_cars', to: 'cars#costly_cars'
end
