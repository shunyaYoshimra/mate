Rails.application.routes.draw do
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_for :users
  root to: 'home#top'
end
