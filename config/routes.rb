Rails.application.routes.draw do
  get '/', to: 'users#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :articles do
    collection do
      post :confirm
    end
  end
end
