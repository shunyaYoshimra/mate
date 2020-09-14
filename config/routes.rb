Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :likes, only: [:index, :create, :destroy]
  end
  get '/posts', to: 'posts#new'
  get '/profiles', to: 'profiles#new'
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_for :users
  root to: 'home#top'
end
