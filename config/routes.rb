Rails.application.routes.draw do
  root "static_pages#home"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, only: [:create, :show]
  resources :posts
  resources :twitter_accounts, except: [:show, :edit, :update]
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
end
