Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :partners
      resources :tasks
      resources :lists
      resources :goals
      resources :users
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

