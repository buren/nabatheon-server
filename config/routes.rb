Rails.application.routes.draw do
  resources :searches

  resources :entities

  resources :chunks

  resource :user
  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: 'login'
  get 'logout', to: 'user_sessions#destroy', as: 'logout'

  root to: 'home#start'
end
