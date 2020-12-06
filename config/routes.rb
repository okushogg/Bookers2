Rails.application.routes.draw do
  get 'home/about'
  root to: 'home#top'
  devise_for :users

    
    resources :users 
    resources :books do
      resource :favorites, only: [:create, :destroy]
      resources :book_comments, only: [:create, :destroy]
    end
    get 'followed_index/:id' => 'relationships#followed_index', as: 'followed_index'

    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
    get 'following_index/:id' => 'relationships#following_index', as: 'following_index'
end
