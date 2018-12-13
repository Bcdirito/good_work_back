Rails.application.routes.draw do
  resources :partners
  resources :tasks
  resources :lists
  resources :goals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
