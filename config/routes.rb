Rails.application.routes.draw do
  resources :posts
  resources :invasive_species
  resources :users

  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
