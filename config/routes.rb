Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :comments, only: [:create, :update, :destroy] do
    resources :likes, only: [:create]
  end

  resources :likes, only: [:destroy]
  resources :users, only: [:create]

  get :haute_couture, to: "haute_couture#show"
end
