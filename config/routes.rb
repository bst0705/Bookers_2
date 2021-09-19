Rails.application.routes.draw do
  
  devise_for :users
  root 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy,] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]
  
  
end
