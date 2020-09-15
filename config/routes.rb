Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  resources :events
  get '/events', to: 'events#new'
  namespace :api, { format: 'json' } do
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :show, :create, :destroy]
  end
  get '/posts', to: 'posts#new'
  get '/profiles', to: 'profiles#new'
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_for :users
  root to: 'home#top'
end
