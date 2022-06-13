Rails.application.routes.draw do
  resources :register, only: [:index, :create]
  resources :projects, only: [:index, :new, :create]
  resources :user, only: [:index]

  # Refer to logout button to see how to work with resources instead of handrolling
  # sessions_path(@user) for logout, something like that, I really don't wanna talk about it
  # resources :sessions, only: [:new, :create, :destroy]

  # Handrolled
  get "/", to: "welcome#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "intruder.alert", to: "intruder#index"
end
