Rails.application.routes.draw do

  root   "static_pages#home"
  get    '/signup',  to: 'users#new'
  get    '/profile', to: 'users#show'
  get    '/login',   to: 'sessions#new'
  resources :users

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :stats, only: [:new, :create, :show]
end
