Rails.application.routes.draw do
  root to: 'books#top'
  devise_for :users

    resources :books
    resources :users 
end
