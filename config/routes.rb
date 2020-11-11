Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  resources :articles

  root to: 'pages#home'

  get "signup", to: "users#new"
  resources :users, expect: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources 'categories', except: [:destroy]
end
