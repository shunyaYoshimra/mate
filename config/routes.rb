Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  resources :rooms, only: [:index, :show, :create]
  resources :relationships, only: [:create, :destroy]
  resources :participants, only: [:create, :destroy]
  resources :events
  namespace :api, { format: 'json' } do
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :show, :create, :destroy]
    resources :messages, only: [:index, :show, :create]
  end
  get '/posts', to: 'posts#new'
  get '/profiles', to: 'profiles#new'
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      get :following, :followers
    end
  end
  devise_for :users
  root to: 'home#top'
end
