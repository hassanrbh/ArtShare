Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"
  get "/signin", to: "sessions#new"
  get "/signup", to: "users#new"
  get "/signout", to: "sessions#destroy" 
  resource :session, :only => [:new,:create,:destroy]
  resources :users, :only => [:new,:create,:show]
end
