# frozen_string_literal: true

Rails.application.routes.draw do

  root 'recipes#index'

  devise_for :users
  resources :foods
  resources :recipes
  resources :inventories, only: [:index, :show, :destroy, :new, :create] do
  end

  namespace :recipes do
    get '', action: 'index'
    get '/:id', action: 'show'
  end
end
