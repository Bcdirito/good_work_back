Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :create, :update, :destroy]
      resources :lists, only: [:index, :create, :update, :destroy]
      resources :goals, only: [:index, :create, :update, :destroy, :show]
      resources :users, only: [:index, :create, :update, :show, :destroy]
      resources :partners, only: [:index, :create]
      resources :doctors, only: [:index, :create, :update, :show, :destroy]
      resources :practices, only: [:index, :create, :update, :destroy]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"
      post "/partners/message", to: "partners#message"
      patch "/partners/update", to: "partners#update"
      delete "partners/delete", to: "partners#destroy"
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

