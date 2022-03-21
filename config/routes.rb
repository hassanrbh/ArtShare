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
  # albums and bands table
  resources :bands do
    resources :albums, :only => :new
  end

  # Tracks Table
  resources :tracks
  resources :albums do
    resources :tracks, only: :new
  end

  # notes Table
  resources :notes, only: [:destroy,:new, :create]
end
