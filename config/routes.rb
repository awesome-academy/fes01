Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :users
  resources :excercises
  resources :lessons do
    resources :excercises, only: :edit
  end
  resources :searches

  namespace :admin do
    root "statistics#index"
    resources :questions
    resources :statistics
    resources :csv, only: :create
    resources :excercises
  end
end
