Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  #user registration and session endpoints
  # post "/api/v1/register", to: "api/v1/users#create"
  # post "/api/v1/login", to: "api/v1/sessions#create"

  namespace :api do 
    namespace :v1 do 
      post "/register", to: "users#create"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      get "/dashboard", to: "dashboard#index"
    end
  end
end
