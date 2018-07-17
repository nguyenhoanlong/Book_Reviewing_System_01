Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    resources :books
    resources :requests, only: %i(edit update index)
  end

  resources :account_activations, only: [:edit]
  resources :books, only: %i(show) do 
    resources :ratings
  end
  resources :users
  resources :requests
  resources :my_requests, only: %i(index)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
