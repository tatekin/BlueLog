Rails.application.routes.draw do
  devise_for :users
  root "logs#index"
  resources :logs, except: :show
  resources :users, only: [:show, :edit, :update]
end
