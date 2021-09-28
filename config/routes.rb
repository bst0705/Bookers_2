Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update, :create]

end
