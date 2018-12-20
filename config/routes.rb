Rails.application.routes.draw do
  resources :partners
  namespace :api do
    namespace :v1 do
      # resources :partners, only: [:get, :create, :update, :show]
      resources :tasks, only: [:index, :create, :update, :destroy]
      resources :lists, only: [:index, :create, :update, :destroy, :show]
      resources :goals, only: [:index, :create, :update, :destroy, :show]
      resources :users, only: [:index, :create, :update, :show, :destroy]
      resources :partners, only: [:index, :create, :update, :show, :destroy]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

