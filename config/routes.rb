Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  # Defines the root path route ("/")
  root "public_recipes#index"
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show , :new, :create, :edit, :update, :destroy]
  
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do 
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :shopping_lists, only: [:index]
  resources :public_recipes, only: [:index]
  resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index, :show]
  end



  resources :foods, only: [:new, :create, :destroy]
end
