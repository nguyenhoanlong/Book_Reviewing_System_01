Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    resources :books
    resources :requests, only: %i(edit update index)
  end

  resources :account_activations, only: [:edit]
  resources :books, only: %i(show) do 
    resources :ratings
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
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :relationships, only: [:create, :destroy]
end
