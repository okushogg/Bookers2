Rails.application.routes.draw do
  get 'home/about'
  root to: 'home#top'
  devise_for :users

    
    resources :users 
    resources :books do
      resource :favorites, only: [:create, :destroy]
      resources :book_comments, only: [:create, :destroy]
    end
    
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
end
