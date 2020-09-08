Rails.application.routes.draw do
  root to: 'main#dashboard'

  devise_for :users

  resources :users, only: :index
  resources :foods
  resources :orders
end
