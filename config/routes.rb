Rails.application.routes.draw do
  devise_for :users
  root to: 'user/top'
    resources :books
    resources :users 
end
