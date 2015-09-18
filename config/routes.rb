Rails.application.routes.draw do
  root 'videos#index'

  resources :videos
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
end
