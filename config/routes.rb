Rails.application.routes.draw do
  devise_for :users
  get 'comments/new'
  get 'comments/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
