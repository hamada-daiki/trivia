Rails.application.routes.draw do
  # devise_for :users
  resources :posts
  resources :likes
  resources :comments
  resources :relationships, only: [:create, :destroy]
  # resources :posts do
  #   resources :comments, only:[:create]
  # end pathのネスト

  # resources :users
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks => 'users/omniauth_callbacks'
    # :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "posts/index" => "posts#index"
  # get "posts/:id" => "posts#show"

  get 'users/index' => "users#index"
  post 'users/search' => "users#search"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  get 'users/:id/like' => "users#like"
  get 'users/:id/following' => "users#following"
  get 'users/:id/follower' => "users#follower"
  post 'users/:id/update' => "users#update"

  get 'posts/:id/category'=> "posts#category"

  post 'likes/:post_id/destroy' => "likes#destroy"

  post 'comments/:post_id/create' => "comments#create"

  get 'home/menu' => "home#menu"
  get 'home/category' => "home#category"
  get 'home/userlank' => "home#userlank"
  root "home#index"
end
