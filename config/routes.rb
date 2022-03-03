Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index,:create,:show,:update,:destroy]

  resources :artworks, only: [:show,:create,:update,:destroy]

  resources :artwork_shares, only: [:create, :destroy]
  
  resources :users do 
    resources :artworks, only: [:index]
  end
  resources :comments, only: [:index, :create, :destroy]
end
