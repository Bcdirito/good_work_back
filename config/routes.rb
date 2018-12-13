Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :partners, only: [:get, :create, :update, :show]
      resources :tasks, only: [:create, :update, :destroy]
      resources :lists, only: [:create, :update, :destroy, :show]
      resources :goals, only: [:create, :update, :destroy, :show]
      resources :users, only: [:create, :update, :show, :destroy]
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

