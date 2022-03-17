Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :sessions, :only => [:new,:create,:destroy]
  resources :users, :only => [:new,:create,:show]
end
