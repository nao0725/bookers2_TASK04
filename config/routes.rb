Rails.application.routes.draw do
  root to: "homes#top"
  get "home/about" => "homes#about"
  
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get "relationship/follow_users" => "relationships#index"
  get "relationship/follower_users" => "relationships#index"
  resources :relationships, only: [:create, :destroy]
  
end
