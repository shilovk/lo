Rails.application.routes.draw do
  use_doorkeeper
  root to: 'main#dashboard'

  devise_for :users

  resources :users, only: :index
  resources :foods
  resources :orders

  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index show]
    end
  end
end
