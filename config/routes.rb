Rails.application.routes.draw do
  get '/', to: 'users#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :articles do
    collection do
      post :confirm
    end
  end
  resources :blogs do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
end
