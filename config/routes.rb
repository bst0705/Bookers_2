Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'homes/about'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :index, :edit, :update, :create]

end
