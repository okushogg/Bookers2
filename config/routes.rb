Rails.application.routes.draw do
  get 'home/about'
  root to: 'home#top'
  get 'mypage', to: 'homes#page'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
    
    resources :users 
    resources :books do
      resource :favorites, only: [:create, :destroy]
      resources :book_comments, only: [:create, :destroy]
    end
    
    
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
    get 'following_index/:id' => 'relationships#following_index', as: 'following_index'
    get 'followed_index/:id' => 'relationships#followed_index', as: 'followed_index'
    
    get '/search' => 'search#search', as: 'search'
    
end
