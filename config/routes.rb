Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  root "static_pages#home"
  namespace :admin do
    resources :books
    resources :requests, only: %i(edit update index)
    resources :categories
  end

  resources :account_activations, only: [:edit]
  resources :books, only: %i(show) do 
    resources :ratings do
      resources :comments
    end
    resources :user_books
  end
  resources :mark_books, only: %i(index)
  resources :users do
    resources :member do
      get :following, :followers
    end
  end
  resources :requests
  resources :search_books, only: %i(index)
  resources :my_requests, only: %i(index)
  resources :search_users, only: %i(index)
  resources :likes, only: %i(create destroy)
  resources :category_books,only: %i(index)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :relationships, only: [:create, :destroy]
end
