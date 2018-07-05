Portrait::Application.routes.draw do

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get ':username', to: 'users#show', as: 'current_user'

  resources :sessions, only: :create
  resources :sites
  resources :users

  namespace :admin do
    resources :sites
    resources :users
  end

  root to: 'home#index'
end
