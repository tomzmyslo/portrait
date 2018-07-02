Portrait::Application.routes.draw do

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: :create
  resources :sites
  resources :users

  root to: 'home#index'
end
