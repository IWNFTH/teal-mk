Rails.application.routes.draw do
  devise_for :users
  root to: "opportunities#index"
  resources :opportunities, only: [:index, :create, :edit, :update, :show] do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :news, only: :index
  resources :company_areas, only: :show, param: :company_area_id
  resources :phases, only: :show, param: :phase_id
end