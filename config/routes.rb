Rails.application.routes.draw do
  devise_for :users
  root to: "opportunities#index"
  resources :opportunities, only: [:index, :create, :edit, :update] do
    resources :comments, only: :create
  end
end