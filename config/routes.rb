Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/search', to: 'searches#search'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update, :create] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

end
