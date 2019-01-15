Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :excercises
  resources :lessons do
    resources :excercises, only: :edit
  end
  resources :searches
  resources :relationships, only: [:create, :destroy]

  namespace :admin do
    root "statistics#index"
    resources :questions
    resources :statistics
    resources :csv, only: :create
    resources :excercises
  end
end
