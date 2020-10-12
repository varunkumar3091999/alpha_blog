Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  resources :articles

  root to: 'pages#home'

  get "signup", to: "users#new"
  resources :users, except: [:new]

end
