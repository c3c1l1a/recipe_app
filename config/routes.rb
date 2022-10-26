Rails.application.routes.draw do
  resources :foods
  resources :recipes
  resources :public_recipes, only: %i[index]
  devise_for :users
  
  root 'recipes#index'
end
