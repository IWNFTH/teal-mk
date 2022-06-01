Rails.application.routes.draw do
  devise_for :users
  root to: "opportunities#index"
  resources :opportunities, only: [:index, :create, :edit, :update, :show] do
    resources :comments, only: :create
  end
  resources :users, only: :show
end