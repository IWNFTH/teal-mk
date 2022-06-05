Rails.application.routes.draw do
  devise_for :users
  root to: "opportunities#index"
  resources :opportunities, only: [:index, :create, :edit, :update, :show] do
    resources :comments, only: :create
    # collection do
      # get 'search'
    # end
  end
  resources :users, only: :show
  resources :news, only: :index
end