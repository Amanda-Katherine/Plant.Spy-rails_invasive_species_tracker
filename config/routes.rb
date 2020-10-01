Rails.application.routes.draw do
  resources :post_environments
  root 'welcome#home'
  
  resources :posts
  resources :invasive_species
  resources :users

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
