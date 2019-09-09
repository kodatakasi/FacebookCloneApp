Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :articles
  post 'articles/new', to: 'articles#create'
end
