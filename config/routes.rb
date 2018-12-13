Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :partners, only: [:get, :create, :new, :edit, :update, :show]
      resources :tasks
      resources :lists
      resources :goals
      resources :users, only: [:get, :create, :new, :edit, :update, :show]
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

