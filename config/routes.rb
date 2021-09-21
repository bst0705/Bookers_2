Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'homes/about'
  resources :books, only: [:create, :index, :show, :destroy, :edit] do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]


end
