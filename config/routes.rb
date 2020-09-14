Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :edit, :update]
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_for :users
  root to: 'home#top'
end
