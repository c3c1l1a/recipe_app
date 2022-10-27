class PublicRecipesController < ApplicationController
	# GET /foods or /foods.json
  before_action :set_public_recipes

  def index
  end

  private 

  def set_public_recipes 
    @recipes = Recipe.where(public: 'true')
  end
end