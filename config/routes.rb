Rails.application.routes.draw do
  get 'home/about'
  root to: 'books#top'
  devise_for :users

    resources :books
    resources :users 
end
