Rails.application.routes.draw do
  resources :places
  resources :container_types
  resources :items
  resources :devices
  resources :device_models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
