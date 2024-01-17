Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  #user registration and session endpoints
  post "/api/v1/register", to: "api/v1/users#create"
end
