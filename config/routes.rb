Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :excercises
  resources :lessons do
    resources :excercises, only: :edit
  end

  namespace :admin do
    root "questions#index"
    resources :questions
  end
end
