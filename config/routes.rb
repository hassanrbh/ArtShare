# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'localhost:1331'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Sessions And Users Configuration::
  root 'bands#index'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'sessions#destroy'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[index new create show destroy] do
    collection do
      get 'activate'
    end
  end
  # albums and bands table
  resources :bands do
    resources :albums, only: :new
  end

  # Tracks Table
  resources :tracks
  resources :albums do
    resources :tracks, only: :new
  end

  # notes Table
  resources :notes, only: %i[destroy new create]

  # tags Table
end
