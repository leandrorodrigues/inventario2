Rails.application.routes.draw do
  resources :containers
  resources :stock_items
  resources :device_types
  resources :device_brands
  resources :places
  resources :container_types
  resources :items
  resources :devices
  resources :device_models

  get '/', action: :index, controller: :pages
end
