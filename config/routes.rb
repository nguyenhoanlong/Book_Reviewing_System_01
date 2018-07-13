Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    resources :books
  end

  namespace :admin do
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
  end

  resources :account_activations, only: [:edit]
  resources :users
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
