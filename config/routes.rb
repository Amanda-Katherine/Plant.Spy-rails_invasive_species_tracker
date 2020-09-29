Rails.application.routes.draw do
  root 'welcome#home'
  
  resources :posts
  resources :invasive_species
  resources :users

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'session#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
