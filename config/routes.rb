Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Sessions And Users Configuration:: 
  root "bands#index"
  get "/signin", to: "sessions#new"
  get "/signup", to: "users#new"
  get "/signout", to: "sessions#destroy" 

  resource :session, :only => [:new,:create,:destroy]
  resources :users, :only => [:new,:create,:show]
  # albums table
  resources :albums, :except => [:new]
  resources :bands do
    resources :albums, :only => :new
  end

end
