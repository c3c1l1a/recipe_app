Rails.application.routes.draw do
  resources :foods
  resources :recipes
  devise_for :users
  
  root 'recipes#index'
end
