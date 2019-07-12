Rails.application.routes.draw do
  resources :posts
  resources :posts, only: [:new, :create, :index] 
  root to: 'posts#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :sessions  
end
