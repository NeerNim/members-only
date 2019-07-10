Rails.application.routes.draw do
  resources :posts
  resources :posts, only: [:new, :create, :index] 
  root to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
end
