Rails.application.routes.draw do

  root to: 'tasks#index'
  resources :tasks

  get 'signup', to: 'users#new'
  post 'register', to: 'users#create'
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
