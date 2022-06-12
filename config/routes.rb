Rails.application.routes.draw do
  resources :register, only: [:index, :create]
  resources :projects, only: [:index]
end
