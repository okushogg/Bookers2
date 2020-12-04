Rails.application.routes.draw do
  get 'home/about'
  root to: 'home#top'
  devise_for :users

    
    resources :users 
    resources :books do
      resources :book_comments, only: [:create, :destroy]
    end
end
